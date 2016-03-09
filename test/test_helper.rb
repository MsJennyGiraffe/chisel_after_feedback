class TestHelper

  def list
    "My favorite cuisines are:

    * Sushi
    * Barbeque
    * Mexican

    I also like other food"
  end

  def list_html
    "My favorite cuisines are:<ul>    <li>Sushi</li>    <li>Barbeque</li>    <li>Mexican</li></ul>    I also like other food"
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

end
