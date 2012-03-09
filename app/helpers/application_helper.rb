module ApplicationHelper
  def titre
    b_titre = "Vue essai"
    if @titre.nil?
      b_titre
    else
      "#{b_titre} | {@titre}"
    end
  end

end
