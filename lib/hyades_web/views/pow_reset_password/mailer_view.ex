defmodule HyadesWeb.PowResetPassword.MailerView do
  use HyadesWeb, :mailer_view

  def subject(:reset_password, _assigns), do: "Reset password link"
end
