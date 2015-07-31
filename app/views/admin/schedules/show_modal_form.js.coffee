$('.uk-modal').html('<%= escape_javascript(render partial: "admin/schedules/form", locals: { schedule: @schedule }) %>')
UIkit.modal('.uk-modal').show()
