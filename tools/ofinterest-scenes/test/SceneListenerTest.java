import conspiracyfiles.ofinterest.SceneListener;
public class SceneListenerTest {
  public static class RBFake { }
  public static class RZSFake { }
  public static class RVSFake { }
  public static class Def { public int getX(){return 10;} public int getY(){return 20;} public int getX2(){return 30;} public int getY2(){return 40;} }
  public static class Zone { public int x=100,y=200,z=0,w=10,h=6; public int pickedXForZoneStory=104, pickedYForZoneStory=203; }
  public static class Spawn { public int x1=1,y1=2,x2=3,y2=4; public float spawnX=2.5f, spawnY=3.5f; }
  public static class Chunk { public Spawn vehicleStorySpawnData=new Spawn(); }
  static void check(boolean b,String m){ if(!b) throw new RuntimeException(m); }
  public static void main(String[] a){
    // a story calling its parent's method: one scene
    SceneListener.enter(new RBFake(),"building",new Object[]{new Def()});
    SceneListener.enter(new RBFake(),"building",new Object[]{new Def()});
    SceneListener.exit(); SceneListener.exit();
    SceneListener.enter(new RZSFake(),"zone",new Object[]{new Zone()}); SceneListener.exit();
    SceneListener.enter(new RVSFake(),"vehicle",new Object[]{new Zone(),new Chunk()}); SceneListener.exit();
    SceneListener.exit(); // an extra exit never goes negative
    String out=SceneListener.drain(10);
    System.out.println(out);
    String[] l=out.split("\n");
    check(l.length==3,"three scenes");
    check(l[0].equals("RBFake|building|10|20|30|40|0|20|30"),"building");
    check(l[1].equals("RZSFake|zone|100|200|110|206|0|104|203"),"zone");
    check(l[2].equals("RVSFake|vehicle|1|2|3|4|0|2|3"),"vehicle");
    check(SceneListener.drain(10).equals(""),"drained");
    check(SceneListener.status().equals("2|3|0|0|0|"),"status "+SceneListener.status());
    SceneListener.enter(new RBFake(),"building",new Object[]{null}); SceneListener.exit();
    check(SceneListener.drain(10).equals(""),"no argument, no line");
    System.out.println("OK "+SceneListener.status());
  }
}
