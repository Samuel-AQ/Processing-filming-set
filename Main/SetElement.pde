public class SetElement{
  private String name;
  private float x, y, z, xRotation, yRotation;
  private PShape body;
  private PImage texture;
  
  public SetElement(String name, float x, float y, float z, float xRotation, float yRotation, PShape body, PImage texture){
    this.name = name;
    this.x = x;
    this.y = y;
    this.z = z;
    this.xRotation = xRotation;
    this.yRotation = yRotation;
    this.body = body;
    this.body.setTexture(texture);
  }
  
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
    pushMatrix();
    translate(x, y, z);
    rotateY(radians(yRotation));
    rotateX(radians(xRotation));
    shape(body);
    popMatrix();
  }
  
  protected void createElement(float elementWidth, float elementHeight){
    pushMatrix();
    translate(x, y, z);
    rotateY(radians(yRotation));
    rotateX(radians(xRotation));
    shape(body, 0, 0, elementWidth, elementHeight);
    popMatrix();
  }
  
  protected void createElement(float elementWidth, float elementHeight, color shapeColor){
    pushMatrix();
    translate(x, y, z);
    rotateY(radians(yRotation));
    rotateX(radians(xRotation));
    body.setFill(shapeColor);
    shape(body, 0, 0, elementWidth, elementHeight);
    popMatrix();
  }
  
  protected void createElement(color shapeColor){
    pushMatrix();
    translate(x, y, z);
    rotateY(radians(yRotation));
    rotateX(radians(xRotation));
    body.setFill(shapeColor);
    shape(body);
    popMatrix();
  }
  
  protected String getName(){
    return name;
  }
  
  protected PShape getShape(){
    return body;
  }
}
