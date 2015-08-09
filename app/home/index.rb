<div id="user_nav">
    <% if user_signed_in? %>
      Logado como <%= current_user.email %>. Não é você?
      <%= link_to 'Sair', destroy_user_session_path, :method => :delete %>
      </br>
      <%= link_to 'Post', posts_path %>
    <% else %>
      <%= link_to 'Cadastrar', new_user_registration_path %> ou <%= link_to 'Logar', new_user_session_path %>
    <% end %>  
  </div>