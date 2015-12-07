// $(document).ready(function(){
//   $('input[type=submit]').on('click',function(event){
//     var form = $(this).parent('form');
//     event.preventDefault();
//     $.ajax({
//       type: 'PUT',
//       url: form.attr('action'),
//       data: form.serialize(),
//       success: function(bars){
//         if @bars{
//           console.log('HERE ARE THE BAAHHHS');
//           <% @bars.each do |bar| %>
//         		<%= link_to venue_path(bar) do %>
//         		 	<div class="venue">
//         		 	<ul>
//          		 		<li><p class='barname'><%= bar.name %></p></li>
//                   <li class = 'baraddress'><%= bar.address %></li>
//          		 		<%if bar.price == nil%>
//         	 		 		<li class="first-row price">?   </li>
//         	 		 			<%elsif bar.price == 0%>
//         	 		 				<li class="first-row price"> <%= "Free" %></li>
//         	 		 			<%else%>
//         	 		 				<li class="first-row price"><%= "$" * bar.price %></li>
//          		 		<%end%>
//         };
//       };
//     });
//   });
// });
