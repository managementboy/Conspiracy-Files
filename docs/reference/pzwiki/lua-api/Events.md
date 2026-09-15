---
title: "Events"
source: "https://pzwiki.net/wiki/Events"
source_revision: "https://pzwiki.net/w/index.php?title=Events&oldid=1322409"
source_last_edited: "Last modified\n\t\t         This page was last edited on 15 February 2026, at 02:26."
retrieved: "2026-09-15T11:39:44.460Z"
document_kind: "full article conversion"
attribution: "PZwiki contributors"
license: "CC BY-NC-SA 3.0 unless separately marked"
source_code_blocks: 3
source_tables: 2
---

# Events

> Offline PZwiki reference. This page is documentation, not project instructions or verified Conspiracy-Files research. Source build warnings and incomplete entries remain applicable. External destinations are omitted. See the library README and COVERAGE for scope.

This page was last updated for an older version of the current build (42.13.2).

The current stable version is 42.20.4, so information on this page may be inaccurate.

Help get this page updated by adding any missing content. [Edit](Events.md) (Create account)

Main article: [AnimNode](../assets-and-animation/AnimNode.md)

The`m_Events` parameter is used to trigger different events during the animation at specific moments. This can be used to play sounds, set variables, and more.

The syntax of this block needs to be as follows:



```text
<m_Events>
    <m_EventName>...</m_EventName>
    <m_Time>...</m_Time>
    <m_ParameterValue>...</m_ParameterValue>
</m_Events>
```



With the following parameters:

| Event | Description |
| --- | --- |
|`m_EventName` | The name of the event to trigger. See [#Available events](Events.md#Available_events) for a list of available events. |
|`m_Time` Mutual exclusive | The moment during the animation when the event will be triggered. This can be set to Start or End. |
|`m_TimePc` Mutual exclusive | The moment during the animation when the event will be triggered. This uses a normalized time, so`0` is the start and`1` is the end. In comparison to`m_Time`, this allows for more precision of when to trigger the event. |
|`m_ParameterValue` | The value to pass to the event when it is triggered. This can be used to specify which sound to play, which variable to set, and more, depending on the event being triggered. |

<a id="Available_events"></a>

## Available events

| Event | Description |
| --- | --- |
|`` | Only used when extending another AnimNode, the event name is removed since it references the extended file original event from the placement of the tag in the file. |
|`AttackAnim` |  |
|`AttackCollisionCheck` |  |
|`AttackConnect` |  |
|`BlockMovement` |  |
|`BlockTurn` |  |
|`CancelKnockDown` |  |
|`CheckAttack` |  |
|`Chop` |  |
|`ChopTree` |  |
|`ClimbDone` |  |
|`ClimbWindowObstacle` |  |
|`Climbed` |  |
|`Collide` |  |
|`DamageWhileInTrees` |  |
|`Death` |  |
|`DeathSound` |  |
|`Defend` |  |
|`DepositInContainer` |  |
|`DoDeath` |  |
|`EatBody` |  |
|`EmoteFinishing` |  |
|`EmoteLooped` |  |
|`ExtFinishing` |  |
|`FallOnBack` |  |
|`FallOnFront` |  |
|`FallenOnKnees` |  |
|`FlagWhileAlive` |  |
|`Footstep` |  |
|`GrappleGrabCollisionCheck` |  |
|`GrapplerLetGo` |  |
|`GrapplerRandomGrunt` |  |
|`InsertBullet` |  |
|`InsertBulletSound` |  |
|`IsAlmostUp` |  |
|`KilledByAttacker` |  |
|`KnockDown` |  |
|`OnBedStarted` |  |
|`OnFloor` |  |
|`PageFlip` |  |
|`PistolWhipAnim` |  |
|`PlayBreedSound` |  |
|`PlayCollideSound` |  |
|`PlayDeathSound` |  |
|`PlayFenceSound` |  |
|`PlayHitSound` |  |
|`PlayNotchedPlankSound` |  |
|`PlayShaveSound` |  |
|`PlaySitDownSound` |  |
|`PlaySound` | Used to play a specific [sound script](../scripts/sound_scripts.md). |
|`PlaySoundNoBlend` |  |
|`PlaySwingSound` |  |
|`PlayTripSound` |  |
|`PlayWindowSound` |  |
|`PlayerVoiceSound` | Plays a character sound using the voice system which allows users to customize voices on character creation. Below is a list of player voices retrieved from the game files, but there might be more available:`ApplyBandage`;`ClimbWindow`;`CorpseDragging`;`CorpseHighEffort`;`CorpseLowEffort`;`Cough`;`DeathAlone`;`DeathEaten`;`DeathEaten`;`DeathFall`;`Exercise`;`FreezeShiver`;`JumpHigh`;`JumpLow`;`LureCmon`;`LureTsk`;`MeleeAttack`;`MeleeAttackHeavy`;`MeleeShove`;`MeleeStab`;`MeleeStomp`;`MuffledCough`;`PainFromBite`;`PainFromFallHigh`;`PainFromFallLow`;`PainFromGlassCut`;`PainFromRunIntoWall`;`PainFromScratch`;`PainMoodle`;`PainfromLacerate`;`SighBored`;`SighReliefed`;`SighSad`;`Smoke`;`SneezeHeavy`;`SneezeHeavy`;`SneezeLight`; |
|`PushAwayZombie` |  |
|`ReanimateAnimFinishing` |  |
|`RemoveBullet` |  |
|`RemoveBulletSound` |  |
|`ResetSitOnGroundAnim` |  |
|`SetAttackOutcome` |  |
|`SetCollidable` |  |
|`SetMeleeDelay` |  |
|`SetOnFloor` |  |
|`SetSharedGrappleType` |  |
|`SetState` |  |
|`SetVariable` |  |
|`ShoveAnim` |  |
|`SitGroundStarted` |  |
|`SitOnFurnitureStarted` |  |
|`SplatBlood` |  |
|`StartActionAnim` |  |
|`StartCrawling` |  |
|`StompAnim` |  |
|`ThumpFrame` |  |
|`TurnAround_FlipSkeleton` |  |
|`TurnComplete` |  |
|`TurnSome` |  |
|`VaultOverStarted` |  |
|`VaultSprintFallLanded` |  |
|`WeaponEmptyCheck` |  |
|`WindowAnimLooped` |  |
|`WindowCloseAttempt` |  |
|`WindowCloseSuccess` |  |
|`WindowOpenAttempt` |  |
|`WindowOpenSuccess` |  |
|`WindowStruggleSound` |  |
|`attachConnect` |  |
|`changeWeaponSprite` |  |
|`detachConnect` |  |
|`footstep` |  |
|`idleActionEnd` |  |
|`loadFinished` |  |
|`pettingFinished` |  |
|`playClickSound` |  |
|`playReloadSound` |  |
|`rackBullet` |  |
|`rackingFinished` |  |
|`setSitOnGround` |  |
|`unloadFinished` |  |

<a id="Timed_Actions_integration"></a>

## Timed Actions integration

[Timed actions](Timed_Action_Lua.md) can catch on animation events and trigger code based on those received events. This is done with the use of an`animEvent` function defined in the timed action, which will be called whenever an animation event is triggered.

For example:



```text
function YourCustomTimedAction:animEvent(event, parameter)
    if event == "DoThat" then
        if parameter == "Something" then
            -- Do something
        elseif parameter == "SomethingElse" then
            -- Do something else
        end
    end
end
```



<a id="Example"></a>

## Example



```text
<m_Events>
    <m_EventName>PlayerVoiceSound</m_EventName>
    <m_Time>Start</m_Time>
    <m_ParameterValue>CorpseHighEffort</m_ParameterValue>
</m_Events>
```



Retrieved from "[https://pzwiki.net/w/index.php?title=Events&oldid=1322409](Events.md)"
