module WickedPdfHelper
  def wicked_pdf_stylesheet_link_tag(*sources)
    css_dir = Rails.root.join('public','stylesheets')
    sources.collect { |source|
      "<style type='text/css'>#{File.read( tomcat_path(css_dir.join(source+'.css').to_s) )}</style>"
    }.join("\n").html_safe
  end

  def wicked_pdf_image_tag(img, options={})
    image_tag "file://#{ tomcat_path(Rails.root.join('public', 'images', img).to_s)}", options
  end

  def wicked_pdf_javascript_src_tag(jsfile, options={})
    javascript_src_tag "file://#{ tomcat_path(Rails.root.join('public','javascripts',jsfile).to_s) }", options
  end

  def wicked_pdf_javascript_include_tag(*sources)
    sources.collect{ |source| wicked_pdf_javascript_src_tag(source, {}) }.join("\n").html_safe
  end


  def tomcat_path(path_string)
    path_string.gsub!("WEB-INF/public","")
  end
  private :tomcat_path

end
