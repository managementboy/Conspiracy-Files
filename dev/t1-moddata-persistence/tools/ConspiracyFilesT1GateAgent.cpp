#include <windows.h>
#include <cstdio>
#include "jni.h"

static JavaVM* g_vm = nullptr;

static void clearException(JNIEnv* env) {
    if (env->ExceptionCheck()) {
        env->ExceptionClear();
    }
}

static DWORD WINAPI gateWorker(LPVOID) {
    // Agent_OnLoad runs during VM startup; wait until the VM is live before
    // attaching this helper thread.
    Sleep(5000);
    JNIEnv* env = nullptr;
    if (g_vm->AttachCurrentThread(reinterpret_cast<void**>(&env), nullptr) != JNI_OK) {
        std::fprintf(stderr, "[CF-T1-AGENT]|ERROR|AttachCurrentThread failed\n");
        std::fflush(stderr);
        return 1;
    }

    bool armed = true;
    while (true) {
        jclass gameWindow = env->FindClass("zombie/GameWindow");
        if (gameWindow == nullptr) {
            clearException(env);
            Sleep(50);
            continue;
        }

        jfieldID statesId = env->GetStaticFieldID(
            gameWindow, "states", "Lzombie/gameStates/GameStateMachine;");
        if (statesId == nullptr) {
            clearException(env);
            env->DeleteLocalRef(gameWindow);
            Sleep(50);
            continue;
        }

        jobject stateMachine = env->GetStaticObjectField(gameWindow, statesId);
        if (stateMachine != nullptr) {
            jclass stateMachineClass = env->GetObjectClass(stateMachine);
            jfieldID currentId = env->GetFieldID(
                stateMachineClass, "current", "Lzombie/gameStates/GameState;");
            if (currentId != nullptr) {
                jobject current = env->GetObjectField(stateMachine, currentId);
                jclass loadingClass = env->FindClass("zombie/gameStates/GameLoadingState");
                if (loadingClass != nullptr && current != nullptr && env->IsInstanceOf(current, loadingClass)) {
                    jfieldID doneId = env->GetStaticFieldID(loadingClass, "done", "Z");
                    jfieldID forceDoneId = env->GetFieldID(loadingClass, "forceDone", "Z");
                    if (doneId != nullptr && forceDoneId != nullptr
                            && env->GetStaticBooleanField(loadingClass, doneId) && armed) {
                        env->SetBooleanField(current, forceDoneId, JNI_TRUE);
                        armed = false;
                        std::printf("[CF-T1-AGENT]|GATE_RELEASED|reason=engine-done-true\n");
                        std::fflush(stdout);
                    }
                } else {
                    armed = true;
                }
                clearException(env);
                if (loadingClass != nullptr) env->DeleteLocalRef(loadingClass);
                if (current != nullptr) env->DeleteLocalRef(current);
            } else {
                clearException(env);
            }
            env->DeleteLocalRef(stateMachineClass);
            env->DeleteLocalRef(stateMachine);
        } else {
            armed = true;
        }

        env->DeleteLocalRef(gameWindow);
        Sleep(50);
    }
}

extern "C" JNIEXPORT jint JNICALL Agent_OnLoad(JavaVM* vm, char*, void*) {
    g_vm = vm;
    HANDLE thread = CreateThread(nullptr, 0, gateWorker, nullptr, 0, nullptr);
    if (thread == nullptr) {
        std::fprintf(stderr, "[CF-T1-AGENT]|ERROR|CreateThread failed\n");
        std::fflush(stderr);
        return JNI_ERR;
    }
    CloseHandle(thread);
    std::printf("[CF-T1-AGENT]|STARTED|mode=physical-click-gate-only\n");
    std::fflush(stdout);
    return JNI_OK;
}
