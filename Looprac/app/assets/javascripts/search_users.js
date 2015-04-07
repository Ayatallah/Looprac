var users
function search(username) {
	$.ajax({
		url: "/find_users?username=" + username,
		success:function(data){
			// display list of users
			console.log(data);
			users = data;
			$("#users_list li").append("<a href='/users/" + users.user_id + "'>" + data.username + "</a>");
		}
	});
}