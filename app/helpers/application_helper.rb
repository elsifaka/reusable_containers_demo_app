module ApplicationHelper
  def titre
    b_titre = "Vue essai"
    if @titre.nil?
      b_titre
    else
      "#{b_titre} | {@titre}"
    end
  end

  def public_view?
    request.env["public"]
  end

  def current_entry
    request.env["current_entry"]
  end

  def current_container
    request.env["current_container"]
  end
end
