[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.interfaces](package-summary.html)
2. [ITexture](ITexture.html)

Contents

1. [Description](#)
2. [Method Summary](#method-summary)
3. [Method Details](#method-detail)
   1. [bind()](#bind())
   2. [bind(int)](#bind(int))
   3. [getData()](#getData())
   4. [getHeight()](#getHeight())
   5. [getHeightHW()](#getHeightHW())
   6. [getID()](#getID())
   7. [getWidth()](#getWidth())
   8. [getWidthHW()](#getWidthHW())
   9. [getXEnd()](#getXEnd())
   10. [getXStart()](#getXStart())
   11. [getYEnd()](#getYEnd())
   12. [getYStart()](#getYStart())
   13. [isSolid()](#isSolid())
   14. [makeTransp(int, int, int)](#makeTransp(int,int,int))
   15. [setAlphaForeach(int, int, int, int)](#setAlphaForeach(int,int,int,int))
   16. [setData(ByteBuffer)](#setData(java.nio.ByteBuffer))
   17. [setMask(Mask)](#setMask(zombie.core.textures.Mask))
   18. [setRegion(int, int, int, int)](#setRegion(int,int,int,int))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Interface ITexture
==================

All Superinterfaces:
:   `zombie.interfaces.IDestroyable, zombie.interfaces.IMaskerable`

All Known Implementing Classes:
:   `AngelCodeFont.CharDefTexture, CharacterSmartTexture, ItemSmartTexture, SmartTexture, Texture, VideoTexture`

---

public interface ITexture
extends zombie.interfaces.IDestroyable, zombie.interfaces.IMaskerable

* Method Summary
  --------------

  All MethodsInstance MethodsAbstract Methods

  Modifier and Type

  Method

  Description

  `void`

  `bind()`

  bind the current texture in the VRAM

  `void`

  `bind(int unit)`

  bind the current texture object in the specified texture unit

  `zombie.core.utils.WrappedBuffer`

  `getData()`

  returns the texture's pixel in a ByteBuffer

  `int`

  `getHeight()`

  returns the height of image

  `int`

  `getHeightHW()`

  return the height hardware of image

  `int`

  `getID()`

  returns the ID of image in the Vram

  `int`

  `getWidth()`

  returns the width of image

  `int`

  `getWidthHW()`

  return the width Hardware of image

  `float`

  `getXEnd()`

  returns the end X-coordinate

  `float`

  `getXStart()`

  returns the start X-coordinate

  `float`

  `getYEnd()`

  returns the end Y-coordinate

  `float`

  `getYStart()`

  returns the start Y-coordinate

  `boolean`

  `isSolid()`

  indicates if the texture is solid or not.  
  a non solid texture is a texture that containe an alpha channel

  `void`

  `makeTransp(int red,
  int green,
  int blue)`

  sets transparent each pixel that it's equal to the red, green blue value specified

  `void`

  `setAlphaForeach(int red,
  int green,
  int blue,
  int alpha)`

  sets the specified alpha for each pixel that it's equal to the red, green blue value specified

  `void`

  `setData(ByteBuffer data)`

  sets the texture's pixel from a ByteBuffer

  `void`

  `setMask(zombie.core.textures.Mask mask)`

  Pixel collision mask of texture

  `void`

  `setRegion(int x,
  int y,
  int width,
  int height)`

  sets the region of the image

  ### Methods inherited from interface zombie.interfaces.IDestroyable

  `destroy, isDestroyed`

  ### Methods inherited from interface zombie.interfaces.IMaskerable

  `getMask`

* Method Details
  --------------

  + ### bind

    void bind()

    bind the current texture in the VRAM
  + ### bind

    void bind(int unit)

    bind the current texture object in the specified texture unit

    Parameters:
    :   `unit` - the texture unit in witch the current TextureObject will be binded
  + ### getData

    zombie.core.utils.WrappedBuffer getData()

    returns the texture's pixel in a ByteBuffer

    EXAMPLE:  
    ByteBuffer bb = getData();  
    byte r, g, b;  
    bb.rewind(); //invalid input: '<'-- IMPORTANT!!  
    try {  
    while (true) {  
    bb.mark();  
    r = bb.get();  
    g = bb.get();  
    b = bb.get();  
    bb.reset();  
    bb.put((byte)(r+red));  
    bb.put((byte)(g+green));  
    bb.put((byte)(b+blue));  
    bb.get(); // alpha  
     }  
     } catch (Exception e) {  
     }  
    setData(bb);

    Returns:
    :   texture's pixel
  + ### getHeight

    int getHeight()

    returns the height of image

    Returns:
    :   the height of image
  + ### getHeightHW

    int getHeightHW()

    return the height hardware of image
  + ### getID

    int getID()

    returns the ID of image in the Vram

    Returns:
    :   the ID of image in the Vram
  + ### getWidth

    int getWidth()

    returns the width of image

    Returns:
    :   the width of image
  + ### getWidthHW

    int getWidthHW()

    return the width Hardware of image
  + ### getXEnd

    float getXEnd()

    returns the end X-coordinate

    Returns:
    :   the end X-coordinate
  + ### getXStart

    float getXStart()

    returns the start X-coordinate

    Returns:
    :   the start X-coordinate
  + ### getYEnd

    float getYEnd()

    returns the end Y-coordinate

    Returns:
    :   the end Y-coordinate
  + ### getYStart

    float getYStart()

    returns the start Y-coordinate

    Returns:
    :   the start Y-coordinate
  + ### isSolid

    boolean isSolid()

    indicates if the texture is solid or not.  
    a non solid texture is a texture that containe an alpha channel

    Returns:
    :   if the texture is solid or not.
  + ### makeTransp

    void makeTransp(int red,
    int green,
    int blue)

    sets transparent each pixel that it's equal to the red, green blue value specified

    Parameters:
    :   `red` - color used in the test
    :   `green` - color used in the test
    :   `blue` - color used in the test
  + ### setAlphaForeach

    void setAlphaForeach(int red,
    int green,
    int blue,
    int alpha)

    sets the specified alpha for each pixel that it's equal to the red, green blue value specified

    Parameters:
    :   `red` - color used in the test
    :   `green` - color used in the test
    :   `blue` - color used in the test
    :   `alpha` - the alpha color that will be setted to the pixel that pass the test
  + ### setData

    void setData([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") data)

    sets the texture's pixel from a ByteBuffer

    EXAMPLE:  
    ByteBuffer bb = getData();  
    byte r, g, b;  
    bb.rewind(); //invalid input: '<'-- IMPORTANT!!  
    try {  
    while (true) {  
    bb.mark();  
    r = bb.get();  
    g = bb.get();  
    b = bb.get();  
    bb.reset();  
    bb.put((byte)(r+red));  
    bb.put((byte)(g+green));  
    bb.put((byte)(b+blue));  
    bb.get(); // alpha  
     }  
     } catch (Exception e) {  
     }  
    setData(bb);

    Parameters:
    :   `data` - texture's pixel data
  + ### setMask

    void setMask(zombie.core.textures.Mask mask)

    Pixel collision mask of texture
  + ### setRegion

    void setRegion(int x,
    int y,
    int width,
    int height)

    sets the region of the image

    Parameters:
    :   `x` - xstart position
    :   `y` - ystart position
    :   `width` - width of the region
    :   `height` - height of the region