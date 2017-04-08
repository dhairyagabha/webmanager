// function formatSelection(data, container){
//     console.log(data.parents);
//     data = $('<span>').addClass('mdl-chip mdl-chip--deletable').append($('<span>').addClass('mdl-chip__text').html(data.text));
//     data.append($('<span>').addClass('mdl-chip__action').html($('<i>').addClass('material-icons').html('cancel')));
//     return data;
// }

$(document).ready(function () {
    $("#article_tag_list").select2({
        placeholder: 'Add Article Tags ...',
        tags: true,
        tokenSeparators: [',', ' ']
    })
});

function remove_fields(link) {
    $(link).prev("input[type=hidden]").val(true);
    $(link).closest(".fields").hide();
}

function add_fields(link, association, content) {
    var new_id = new Date().getTime();
    var regexp = new RegExp("new_" + association, "g");
    $('.new-fields').append(content.replace(regexp, new_id));
}