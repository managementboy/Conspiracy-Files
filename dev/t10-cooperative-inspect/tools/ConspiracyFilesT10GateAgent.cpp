#include <windows.h>
#include <cstdio>
#include "jni.h"

// SECURITY STOP (2026-09-01): retained only to audit the stopped T10 attempt.
// Do not rebuild or relaunch this helper until user/security review approves a
// safe manual-GUI route. Never restore the separately flagged runner.exe,
// weaken protection, add exclusions, or use this source to bypass protection.

static JavaVM* g_vm = nullptr;

static void clearException(JNIEnv* env) {
    if (env->ExceptionCheck()) env->ExceptionClear();
}

static DWORD WINAPI gateWorker(LPVOID) {
    Sleep(5000);
    JNIEnv* env = nullptr;
    if (g_vm->AttachCurrentThread(reinterpret_cast<void**>(&env), nullptr) != JNI_OK) {
        std::fprintf(stderr, "[CF-T10-AGENT]|ERROR|AttachCurrentThread failed\n");
        std::fflush(stderr);
        return 1;
    }

    bool loadingArmed = true;
    bool logoArmed = true;
    while (true) {
        jclass gameWindow = env->FindClass("zombie/GameWindow");
        if (gameWindow == nullptr) { clearException(env); Sleep(50); continue; }
        jfieldID statesId = env->GetStaticFieldID(gameWindow, "states", "Lzombie/gameStates/GameStateMachine;");
        if (statesId == nullptr) { clearException(env); env->DeleteLocalRef(gameWindow); Sleep(50); continue; }
        jobject stateMachine = env->GetStaticObjectField(gameWindow, statesId);
        if (stateMachine != nullptr) {
            jclass stateMachineClass = env->GetObjectClass(stateMachine);
            jfieldID currentId = env->GetFieldID(stateMachineClass, "current", "Lzombie/gameStates/GameState;");
            if (currentId != nullptr) {
                jobject current = env->GetObjectField(stateMachine, currentId);
                jclass mainClass = env->FindClass("zombie/gameStates/MainScreenState");
                if (mainClass != nullptr && current != nullptr && env->IsInstanceOf(current, mainClass)) {
                    jfieldID showLogoId = env->GetFieldID(mainClass, "showLogo", "Z");
                    if (showLogoId != nullptr && env->GetBooleanField(current, showLogoId) && logoArmed) {
                        env->SetBooleanField(current, showLogoId, JNI_FALSE);
                        logoArmed = false;
                        std::printf("[CF-T10-AGENT]|LOGO_GATE_RELEASED|field=MainScreenState.showLogo\n");
                        std::fflush(stdout);
                    }
                } else {
                    logoArmed = true;
                }
                clearException(env);

                jclass loadingClass = env->FindClass("zombie/gameStates/GameLoadingState");
                if (loadingClass != nullptr && current != nullptr && env->IsInstanceOf(current, loadingClass)) {
                    jfieldID doneId = env->GetStaticFieldID(loadingClass, "done", "Z");
                    jfieldID forceDoneId = env->GetFieldID(loadingClass, "forceDone", "Z");
                    if (doneId != nullptr && forceDoneId != nullptr && env->GetStaticBooleanField(loadingClass, doneId) && loadingArmed) {
                        env->SetBooleanField(current, forceDoneId, JNI_TRUE);
                        loadingArmed = false;
                        std::printf("[CF-T10-AGENT]|LOADING_GATE_RELEASED|reason=engine-done-true\n");
                        std::fflush(stdout);
                    }
                } else {
                    loadingArmed = true;
                }
                clearException(env);

                if (loadingClass != nullptr) env->DeleteLocalRef(loadingClass);
                if (mainClass != nullptr) env->DeleteLocalRef(mainClass);
                if (current != nullptr) env->DeleteLocalRef(current);
            } else clearException(env);
            env->DeleteLocalRef(stateMachineClass);
            env->DeleteLocalRef(stateMachine);
        } else {
            loadingArmed = true;
            logoArmed = true;
        }
        env->DeleteLocalRef(gameWindow);
        Sleep(50);
    }
}

extern "C" JNIEXPORT jint JNICALL Agent_OnLoad(JavaVM* vm, char*, void*) {
    g_vm = vm;
    HANDLE thread = CreateThread(nullptr, 0, gateWorker, nullptr, 0, nullptr);
    if (thread == nullptr) return JNI_ERR;
    CloseHandle(thread);
    std::printf("[CF-T10-AGENT]|STARTED|mode=main-logo-and-engine-done-loading-gates-only\n");
    std::fflush(stdout);
    return JNI_OK;
}
