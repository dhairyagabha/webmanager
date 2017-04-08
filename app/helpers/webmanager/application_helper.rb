module Webmanager
  module ApplicationHelper
    def link_to_remove_fields(name, f)
      f.hidden_field(:_destroy) + link_to(name, '#', onclick: "remove_fields(this)", class:'mdl-button mdl-js-button mdl-button--fab mdl-button--mini-fab mdl-button--colored')
    end

    def link_to_add_fields(name, f, association)
      new_object = f.object.class.reflect_on_association(association).klass.new
      fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
        render(association.to_s.singularize + "_fields", :f => builder)
      end
      link_to( name, '#', onclick:"add_fields(this, \"#{association}\", \"#{escape_javascript(fields)}\")", class:'mdl-button mdl-js-button mdl-button--raised mdl-button--accent')
    end
    def custom_flash
      flash_messages = []
      flash.each do |type, message|
        type = 'success' if type == 'notice'
        type = 'error'   if type == 'alert'
        text =
            "<script>
              $('#notification').addClass('#{type}');
              $('#notification').html('#{message}');
              setTimeout(function () {
                $('#notification').slideUp();
              }, 3000);
            </script>"
        flash_messages << text.html_safe if message
      end
      flash_messages.join("\n").html_safe
    end
    def new_path
      path = {controller: controller_path, action: :new}
      return path
    end
    def google_analytics(uid)
      code =
      "<script>
          (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
            (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
              m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
          })(window,document,'script','https://www.google-analytics.com/analytics.js','ga');

      ga('create', '#{uid}', 'auto');
      ga('send', 'pageview');

      </script>"
      return code
    end


    def get_articles_by_tag(name)
      @articles = Article.tagged_with(name)
    end
  end
end
