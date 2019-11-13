class InfoFormsController < ApplicationController
  def create
    info_form = InfoForm.create(info_form_params)
    errors = info_form.errors.full_messages
    render json: { id: info_form.id, errors: errors }.to_json,
      status: errors.length.positive? ? :unprocessable_entity : :ok
  end

  private def info_form_params
    params.require(:info_form).permit(:name, :event_id)
  end
end
