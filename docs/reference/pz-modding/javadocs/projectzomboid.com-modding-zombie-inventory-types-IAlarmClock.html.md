[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.inventory.types](package-summary.html)
2. [IAlarmClock](IAlarmClock.html)

Contents

1. [Description](#)
2. [Method Summary](#method-summary)
3. [Method Details](#method-detail)
   1. [stopRinging()](#stopRinging())
   2. [setAlarmSet(boolean)](#setAlarmSet(boolean))
   3. [isAlarmSet()](#isAlarmSet())
   4. [setHour(int)](#setHour(int))
   5. [setMinute(int)](#setMinute(int))
   6. [setForceDontRing(int)](#setForceDontRing(int))
   7. [getHour()](#getHour())
   8. [getMinute()](#getMinute())
   9. [update()](#update())

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Interface IAlarmClock
=====================

All Known Implementing Classes:
:   `AlarmClock, AlarmClockClothing`

---

public interface IAlarmClock

* Method Summary
  --------------

  All MethodsInstance MethodsAbstract Methods

  Modifier and Type

  Method

  Description

  `int`

  `getHour()`

  `int`

  `getMinute()`

  `boolean`

  `isAlarmSet()`

  `void`

  `setAlarmSet(boolean alarmSet)`

  `void`

  `setForceDontRing(int min)`

  `void`

  `setHour(int hour)`

  `void`

  `setMinute(int min)`

  `void`

  `stopRinging()`

  `void`

  `update()`

* Method Details
  --------------

  + ### stopRinging

    void stopRinging()
  + ### setAlarmSet

    void setAlarmSet(boolean alarmSet)
  + ### isAlarmSet

    boolean isAlarmSet()
  + ### setHour

    void setHour(int hour)
  + ### setMinute

    void setMinute(int min)
  + ### setForceDontRing

    void setForceDontRing(int min)
  + ### getHour

    int getHour()
  + ### getMinute

    int getMinute()
  + ### update

    void update()