class TestHelper

  def list
    "My favorite cuisines are:

    * Sushi
    * Barbeque
    * Mexican

    I also like other food"
  end

  def list_html
    "<p>My favorite cuisines are:</p>
    <p></p>
        <ul>
    <li> Sushi </li>
        <li> Barbeque </li>
        <li> Mexican </li>
    </ul>
    <p></p>
    <p>    I also like other food</p>"

  end

  def different_list
    "This is a list:
      * this is a thing
      * this is an even longer thing
      * look how long this thing is..."
  end

  def different_list_html
    "This is a list:<ul>      <li>this is a thing</li>      <li>this is an even longer thing</li>      <li>look how long this thing is...</li></ul>"
  end

  def ordered_lists_markdown
    "This is an ordered list:
     1. This is item one
     2. This is item two"
  end

end
