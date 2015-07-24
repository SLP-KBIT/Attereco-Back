<% if @attend.errors.empty? %>
  location.reload(true)
<% else %>
  alert('<%= escape_javascript @attend.errors.full_messages.join("\n") %>')
<% end %>
