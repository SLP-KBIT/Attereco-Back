<% if @schedule.errors.empty? %>
  location.reload(true)
<% else %>
  alert('<%= escape_javascript @schedule.errors.full_messages.join("\n") %>')
<% end %>
