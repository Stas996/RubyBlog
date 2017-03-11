module AjaxHelper
  def redirect_to_ajax(redirect_js_file)
    respond_to do |format|
      format.html { redirect_to article_path(@article) }
      format.js {render file: redirect_js_file}
    end
  end
end