$('.uk-modal').html('<%= escape_javascript(render partial: "admin/attends/form", locals: { attend: @attend }) %>')
UIkit.modal('.uk-modal').show()
