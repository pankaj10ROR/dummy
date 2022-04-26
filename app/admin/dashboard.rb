# frozen_string_literal: true
ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: proc { I18n.t("active_admin.dashboard") }

  content title: proc { I18n.t("active_admin.dashboard") } do
    # div class: "blank_slate_container", id: "dashboard_default_message" do
    #   span class: "blank_slate" do
    #     span I18n.t("active_admin.dashboard_welcome.welcome")
    #     small I18n.t("active_admin.dashboard_welcome.call_to_action")
    #   end

    # index do
    #   id_column
    #   column :question
    #   actions
    # end

    # index as: :grid do |reason|
    #   link_to image_tag(reason.question), admin_reason_path(reason)
    # end

    # Here is an example of a simple dashboard with columns and panels.
    #
    columns do
      column do
        panel "Recent Approvable" do
          ul do
            Reason.last(5).map do |post|
              if post.answer == nil
              span link_to(post.question, admin_reason_path(post))
            end
            end
          end
        end
      end
    end


end
    #   column do
    #     panel "Info" do
    #       para "Welcome to ActiveAdmin."
    #     end
    #   end
    # end
  # end # content
end





