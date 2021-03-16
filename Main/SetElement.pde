public class SetElement{
  private String name;
  private float x, y, z, xRotation, yRotation;
  private PShape body;
  private PImage texture;
  
  public SetElement(String name, float x, float y, float z, float xRotation, float yRotation, PShape body){
    this.name = name;
    this.x = x;
    this.y = y;
    this.z = z;
    this.xRotation = xRotation;
    this.yRotation = yRotation;
    this.body = body;
  }
  
  protected void createElement(){
    //pushMatrix();
    //translate()
  }
  
  protected String getName(){
    return name;
  }
  
  protected PShape getShape(){
    return body;
  }
}
