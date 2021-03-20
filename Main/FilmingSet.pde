public class FilmingSet{
  private HashMap <String, SetElement> elements;
  
  public FilmingSet(){
    elements = new HashMap<String, SetElement>();
  }
  
  protected void addElement(SetElement element){
    elements.put(element.getName(), element);
  }
  
  protected SetElement getElement(String name){
    return elements.get(name);
  }
}
