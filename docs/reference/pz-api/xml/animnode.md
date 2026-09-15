---
title: "animNode"
source: "https://pz-wiki-modding.github.io/PZ-API-Docs/xml/animnode.html"
source_repository: "https://github.com/PZ-Wiki-Modding/PZ-API-Docs"
source_commit: "effa0bc0f07b2be60da80a3bc374132b95d3118c"
source_path: "docs/source/xml/animnode.rst"
game_version: "42.20.4"
retrieved: "2026-09-15"
document_kind: "full source conversion"
authority: "external reference; verify against installed build and project research"
license: "Upstream custom permission; see ATTRIBUTION.md and LICENSE.txt"
---

<a id="animnode"></a>

<a id="xml-animnode"></a>

# animNode

The AnimNode files are used to link animation files to the game by defining different parameters for the animation. This will notably control the speed of the animation, its blending with animations played before and after, events that need to be triggered and conditions that control when that animation can be played.

<a id="file-patterns"></a>

## File Patterns

The following file patterns are used to determine what the valid path for the XML file can be, relative to the [media](../../pzwiki/foundations/Mod_structure.md) folder.

- `**/AnimSets/**/*.xml`

<a id="root-details"></a>

<a id="animnode-type-animnode"></a>

## Root Details

**Element:** animNode

The root element is the top-level XML element that contains all other elements in the XML file.

**Composition:** all

<a id="elements"></a>

### Elements

<a id="m-name"></a>

#### m_Name

**Minimum occurence:** 1

**Maximum occurence:** 1

**Type:** `xs:string`

A unique identifier for this animation node. For example: “LoadRiffle”, “Walk” etc. This is notably used to reference this animNode in other animNodes.

<a id="m-animname"></a>

#### m_AnimName

**Minimum occurence:** 0

**Maximum occurence:** 1

**Type:** `xs:string`

Name of the animation clip to play. This is the name of the animation file without the extension. The animation clip needs to be stored inside the `anims_X` folder and inside a subfolder which matches the character the animation is for. For the player, that subfolder needs to be `Bob`.

For example, take the animation file `Bob_Reload_Rifle_Load.glb` with the following folder structure:



```
📁 media
  📁 anims_X
    📁 Bob
      📄 Bob_Reload_Rifle_Load.glb
```



To reference it in the animNode, you would use:



```xml
<m_AnimName>Bob_Reload_Rifle_Load</m_AnimName>
```



<a id="m-blendtime"></a>

#### m_BlendTime

**Minimum occurence:** 0

**Maximum occurence:** 1

**Type:** `xs:float`

Defines how quickly the animation will begin to play, and how the game interpolates moving the armature’s bones from one animNode to another.

<a id="m-blendintime"></a>

#### m_BlendInTime

**Minimum occurence:** 0

**Maximum occurence:** 1

**Type:** `xs:float`

Defines how quickly the animation will begin to play, and how the game interpolates moving the armature’s bones from one animState to another. It is used to create a smooth transition when the animation is started or changed.

<a id="m-blendouttime"></a>

#### m_BlendOutTime

**Minimum occurence:** 0

**Maximum occurence:** 1

**Type:** `xs:float`

Defines how quickly the animation will end, and how the game interpolates moving the armature’s bones from one animState to another. It is used to create a smooth transition when the animation is stopped or changed.

<a id="m-speedscale"></a>

#### m_SpeedScale

**Minimum occurence:** 0

**Maximum occurence:** 1

**Type:** `xs:float`, `xs:string`

No description provided.

<a id="m-speedscalerandommultipliermin"></a>

#### m_SpeedScaleRandomMultiplierMin

**Minimum occurence:** 0

**Maximum occurence:** 1

**Type:** `xs:float`

No description provided.

<a id="m-speedscalerandommultipliermax"></a>

#### m_SpeedScaleRandomMultiplierMax

**Minimum occurence:** 0

**Maximum occurence:** 1

**Type:** `xs:float`

No description provided.

<a id="m-tracktimetovariable"></a>

#### m_TrackTimeToVariable

**Minimum occurence:** 0

**Maximum occurence:** 1

**Type:** `xs:string`

No description provided.

<a id="m-finished"></a>

#### m_Finished

**Minimum occurence:** 0

**Maximum occurence:** 1

**Type:** `xs:string`

Looks unused.

<a id="m-looped"></a>

#### m_Looped

**Minimum occurence:** 0

**Maximum occurence:** 1

**Type:** `xs:boolean`

Defines whether the animation will loop or not. If set to true, the animation will loop indefinitely until it is manually stopped or conditions are no longer met.

<a id="m-animreverse"></a>

#### m_AnimReverse

**Minimum occurence:** 0

**Maximum occurence:** 1

**Type:** `xs:boolean`

No description provided.

<a id="m-priority"></a>

#### m_Priority

**Minimum occurence:** 0

**Maximum occurence:** 1

**Type:** `xs:integer`

In cases of two animations that are playing at the same time, dictates which animation’s bone weights or keyframes will take precedence. An example would be an idle animMask holding a glass which transitions into a drinking animation. The drinking animation takes priority over the idle drink-holding ainmMask if its priority is higher than the idle animation mask’s XML. The priority value is an integer starting at 1 with high numbers taking the priority.

<a id="m-conditionpriority"></a>

#### m_ConditionPriority

**Minimum occurence:** 0

**Maximum occurence:** 1

**Type:** `xs:integer`

No description provided.

<a id="m-maxtorsotwist"></a>

#### m_maxTorsoTwist

**Minimum occurence:** 0

**Maximum occurence:** 1

**Type:** `xs:float`

No description provided.

<a id="m-scalar"></a>

#### m_Scalar

**Minimum occurence:** 0

**Maximum occurence:** unbounded

**Type:** `xs:float`, `xs:string`

No description provided.

<a id="m-scalar2"></a>

#### m_Scalar2

**Minimum occurence:** 0

**Maximum occurence:** unbounded

**Type:** `xs:float`, `xs:string`

No description provided.

<a id="m-synctrackingenabled"></a>

#### m_SyncTrackingEnabled

**Minimum occurence:** 0

**Maximum occurence:** unbounded

**Type:** `xs:boolean`

No description provided.

<a id="m-2dblends"></a>

#### m_2DBlends

**Minimum occurence:** 0

**Maximum occurence:** unbounded

**Type:** [type_2DBlends](animnode.md#animnode-type-2dblends)

No description provided.

<a id="m-2dblendtri"></a>

#### m_2DBlendTri

**Minimum occurence:** 0

**Maximum occurence:** unbounded

**Type:** [type_2DBlendTri](animnode.md#animnode-type-2dblendtri)

No description provided.

<a id="m-conditions"></a>

#### m_Conditions

**Minimum occurence:** 0

**Maximum occurence:** unbounded

**Type:** [type_Condition](animnode.md#animnode-type-condition)

Used to specify conditions that will allow an animation node to be chosen. If the conditions are not met, the node will not be chosen. These are often combined with the function setVariable) (which exists in many forms) to set a specific condition.

This can notably be used to trigger an animation by setting that condition to be valid, which will make the animation node eligible to be chosen by the game, as long as other conditions are also met.

The syntax is as follows for the most common cases:



```xml
<m_Conditions>
  <m_Name>VariableName</m_Name>
  <m_Type>STRING</m_Type>
  <m_Value>value</m_Value>
</m_Conditions>
```



In the following example, the variable `WeaponReloadType` is set by the game, using the parameter of the same name in the item script:



```xml
<m_Conditions>
    <m_Name>WeaponReloadType</m_Name>
    <m_Type>STRING</m_Type>
    <m_Value>revolver</m_Value>
</m_Conditions>
```



<a id="m-events"></a>

#### m_Events

**Minimum occurence:** 0

**Maximum occurence:** unbounded

**Type:** [type_Events](animnode.md#animnode-type-events)

Used to trigger different events during the animation at specific moments. This can be used to play sounds, set variables, and more. You can find a list of available events [here](../../pzwiki/lua-api/Events.md).

<a id="m-transitions"></a>

#### m_Transitions

**Minimum occurence:** 0

**Maximum occurence:** unbounded

**Type:** [type_Transitions](animnode.md#animnode-type-transitions)

No description provided.

<a id="m-earlytransitionout"></a>

#### m_EarlyTransitionOut

**Minimum occurence:** 0

**Maximum occurence:** 1

**Type:** `xs:boolean`

No description provided.

<a id="m-stopanimonexit"></a>

#### m_StopAnimOnExit

**Minimum occurence:** 0

**Maximum occurence:** 1

**Type:** `xs:boolean`

No description provided.

<a id="m-substateboneweights"></a>

#### m_SubStateBoneWeights

**Minimum occurence:** 0

**Maximum occurence:** unbounded

**Type:** [type_SubStateBoneWeights](animnode.md#animnode-type-substateboneweights)

Used to define the weight of a bone and its keyframes or descendants. By default, all bones that are not defined with this parameter have a default weight of `1`. If you wanted to make it so an animation were to only play a specific set of bones; you would define the Dummy01 or the Bip01 bones (the parent armature bones) to have a weight of 0, and then specifically define all the bones you wish to play to have a weight value greater than 0.

<a id="m-deferredbonename"></a>

#### m_DeferredBoneName

**Minimum occurence:** 0

**Maximum occurence:** 1

**Type:** `xs:string`

No description provided.

<a id="m-deferredboneaxis"></a>

#### m_deferredBoneAxis

**Minimum occurence:** 0

**Maximum occurence:** 1

**Type:** `xs:string`

No description provided.

<a id="m-usedeferedrotation"></a>

#### m_useDeferedRotation

**Minimum occurence:** 0

**Maximum occurence:** 1

**Type:** `xs:boolean`

No description provided.

<a id="m-matchinggrappledanimnode"></a>

#### m_MatchingGrappledAnimNode

**Minimum occurence:** 0

**Maximum occurence:** 1

**Type:** `xs:string`

No description provided.

<a id="m-grappleoffsetforward"></a>

#### m_GrappleOffsetForward

**Minimum occurence:** 0

**Maximum occurence:** 1

**Type:** `xs:float`

No description provided.

<a id="m-grappleoffsetyaw"></a>

#### m_GrappleOffsetYaw

**Minimum occurence:** 0

**Maximum occurence:** 1

**Type:** `xs:integer`

No description provided.

<a id="m-grappleroffsetbehaviour"></a>

#### m_GrapplerOffsetBehaviour

**Minimum occurence:** 0

**Maximum occurence:** 1

**Type:** `xs:string`

No description provided.

<a id="m-grappletweenintime"></a>

#### m_GrappleTweenInTime

**Minimum occurence:** 0

**Maximum occurence:** 1

**Type:** `xs:float`

No description provided.

<a id="m-usedeferredmovement"></a>

#### m_useDeferredMovement

**Minimum occurence:** 0

**Maximum occurence:** 1

**Type:** `xs:boolean`

No description provided.

<a id="attributes"></a>

### Attributes

<a id="x-extends"></a>

#### x_extends

**Type:** `xs:string`

**Use:** optional

Import another relative animNode file into this one. Needs to be the file name so for the following example folder structure:



```
📁 media
  📁 AnimSets
    📁 Rifle
      📄 LoadRifle.xml
      📄 LoadRifle_Alt.xml
```



The LoadRifle_Alt.xml file can import the LoadRifle.xml file by using:



```xml
<animNode x_extends="LoadRifle.xml"></animNode>
```



<a id="type-2dblends"></a>

<a id="animnode-type-2dblends"></a>

## type_2DBlends

**Composition:** all

<a id="id1"></a>

### Elements

<a id="id2"></a>

#### m_AnimName

**Minimum occurence:** 0

**Maximum occurence:** 1

**Type:** `xs:string`

No description provided.

<a id="m-xpos"></a>

#### m_XPos

**Minimum occurence:** 0

**Maximum occurence:** 1

**Type:** `xs:float`

No description provided.

<a id="m-ypos"></a>

#### m_YPos

**Minimum occurence:** 0

**Maximum occurence:** 1

**Type:** `xs:float`

No description provided.

<a id="id3"></a>

#### m_SpeedScale

**Minimum occurence:** 0

**Maximum occurence:** 1

**Type:** `xs:float`

No description provided.

<a id="id4"></a>

#### m_SubStateBoneWeights

**Minimum occurence:** 0

**Maximum occurence:** unbounded

**Type:** [type_SubStateBoneWeights](animnode.md#animnode-type-substateboneweights)

No description provided.

<a id="id5"></a>

### Attributes

<a id="referenceid"></a>

#### referenceID

**Type:** `xs:integer`

**Use:** optional

No description provided.

<a id="type-2dblendtri"></a>

<a id="animnode-type-2dblendtri"></a>

## type_2DBlendTri

**Composition:** all

<a id="id6"></a>

### Elements

<a id="node1"></a>

#### node1

**Minimum occurence:** 0

**Maximum occurence:** unbounded

**Type:** `xs:integer`

No description provided.

<a id="node2"></a>

#### node2

**Minimum occurence:** 0

**Maximum occurence:** unbounded

**Type:** `xs:integer`

No description provided.

<a id="node3"></a>

#### node3

**Minimum occurence:** 0

**Maximum occurence:** unbounded

**Type:** `xs:integer`

No description provided.

<a id="type-condition"></a>

<a id="animnode-type-condition"></a>

## type_Condition

**Composition:** all

<a id="id7"></a>

### Elements

<a id="id8"></a>

#### m_Name

**Minimum occurence:** 0

**Maximum occurence:** unbounded

**Type:** `xs:string`

No description provided.

<a id="m-type"></a>

#### m_Type

**Minimum occurence:** 0

**Maximum occurence:** unbounded

**Type:** [rule_Type](animnode.md#animnode-rule-type)

No description provided.

<a id="m-condition"></a>

#### m_Condition

**Minimum occurence:** 0

**Maximum occurence:** unbounded

**Type:** `xs:string`

No description provided.

<a id="m-value"></a>

#### m_Value

**Minimum occurence:** 0

**Maximum occurence:** unbounded

**Type:** `xs:string`

No description provided.

<a id="m-intvalue"></a>

#### m_IntValue

**Minimum occurence:** 0

**Maximum occurence:** unbounded

**Type:** `xs:integer`

No description provided.

<a id="m-floatvalue"></a>

#### m_FloatValue

**Minimum occurence:** 0

**Maximum occurence:** unbounded

**Type:** `xs:float`

No description provided.

<a id="m-boolvalue"></a>

#### m_BoolValue

**Minimum occurence:** 0

**Maximum occurence:** unbounded

**Type:** `xs:boolean`

No description provided.

<a id="m-stringvalue"></a>

#### m_StringValue

**Minimum occurence:** 0

**Maximum occurence:** unbounded

**Type:** `xs:string`

No description provided.

<a id="id9"></a>

### Attributes

<a id="x-name"></a>

#### x_name

**Type:** `xs:string`

**Use:** optional

This is unused by the game but it seems to be a simple identifier (often a GUID) used by the unreleased AnimZed.

<a id="type-events"></a>

<a id="animnode-type-events"></a>

## type_Events

**Composition:** all

<a id="id10"></a>

### Elements

<a id="m-eventname"></a>

#### m_EventName

**Minimum occurence:** 0

**Maximum occurence:** 1

**Type:** `xs:string`

The name of the event to trigger. This can be a custom name but there’s also available events that will trigger specific actions. You can find a list of available events [here](../../pzwiki/lua-api/Events.md).

<a id="m-time"></a>

#### m_Time

**Minimum occurence:** 0

**Maximum occurence:** 1

**Type:** [rule_Time](animnode.md#animnode-rule-time)

The moment during the animation when the event will be triggered. This can be set to Start or End.

<a id="m-timepc"></a>

#### m_TimePc

**Minimum occurence:** 0

**Maximum occurence:** 1

**Type:** [rule_TimePc](animnode.md#animnode-rule-timepc)

The moment during the animation when the event will be triggered. This uses a normalized time, so `0` is the start and `1` is the end. In comparison to `m_Time`, this allows for more precision of when to trigger the event.

<a id="m-parametervalue"></a>

#### m_ParameterValue

**Minimum occurence:** 0

**Maximum occurence:** 1

**Type:** `xs:string`

The value to pass to the event when it is triggered. This can be used to specify which sound to play, which variable to set, and more, depending on the event being triggered.

<a id="id12"></a>

### Attributes

<a id="id13"></a>

#### x_name

**Type:** `xs:string`

**Use:** optional

This is unused by the game but it seems to be a simple identifier (often a GUID) used by the unreleased AnimZed.

<a id="type-transitions"></a>

<a id="animnode-type-transitions"></a>

## type_Transitions

**Composition:** all

<a id="id16"></a>

### Elements

<a id="m-target"></a>

#### m_Target

**Minimum occurence:** 0

**Maximum occurence:** unbounded

**Type:** `xs:string`

The name of the target animNode to transition to. This is the value of the `m_Name` field in the target animNode.

<a id="id17"></a>

#### m_AnimName

**Minimum occurence:** 0

**Maximum occurence:** 1

**Type:** `xs:string`

No description provided.

<a id="id18"></a>

#### m_BlendTime

**Minimum occurence:** 0

**Maximum occurence:** 1

**Type:** `xs:float`

No description provided.

<a id="id19"></a>

#### m_BlendInTime

**Minimum occurence:** 0

**Maximum occurence:** 1

**Type:** `xs:float`

No description provided.

<a id="id20"></a>

#### m_BlendOutTime

**Minimum occurence:** 0

**Maximum occurence:** 1

**Type:** `xs:float`

No description provided.

<a id="id21"></a>

#### m_speedScale

**Minimum occurence:** 0

**Maximum occurence:** 1

**Type:** `xs:float`

No description provided.

<a id="id22"></a>

#### m_Conditions

**Minimum occurence:** 0

**Maximum occurence:** unbounded

**Type:** [type_Condition](animnode.md#animnode-type-condition)

No description provided.

<a id="id23"></a>

#### m_EarlyTransitionOut

**Minimum occurence:** 0

**Maximum occurence:** 1

**Type:** `xs:boolean`

No description provided.

<a id="type-substateboneweights"></a>

<a id="animnode-type-substateboneweights"></a>

## type_SubStateBoneWeights

**Composition:** all

<a id="id24"></a>

### Elements

<a id="bonename"></a>

#### boneName

**Minimum occurence:** 0

**Maximum occurence:** 1

**Type:** `xs:string`

No description provided.

<a id="includedescendants"></a>

#### includeDescendants

**Minimum occurence:** 0

**Maximum occurence:** 1

**Type:** `xs:boolean`

No description provided.

<a id="weight"></a>

#### weight

**Minimum occurence:** 0

**Maximum occurence:** 1

**Type:** `xs:float`

No description provided.

<a id="rule-type"></a>

<a id="animnode-rule-type"></a>

## rule_Type

**Composition:** all

<a id="restrictions"></a>

### Restrictions

**Base:** `xs:string`

**Enumeration:**

- `STRING`
- `BOOL`
- `INT`
- `FLOAT`
- `OR`
- `EQU`
- `NEQ`
- `STRNEQ`
- `GTR`
- `LESS`

<a id="rule-time"></a>

<a id="animnode-rule-time"></a>

## rule_Time

**Composition:** all

<a id="id25"></a>

### Restrictions

**Base:** `xs:string`

**Enumeration:**

- `Start`
- `End`

<a id="rule-timepc"></a>

<a id="animnode-rule-timepc"></a>

## rule_TimePc

**Composition:** all

<a id="id26"></a>

### Restrictions

**Base:** `xs:float`
