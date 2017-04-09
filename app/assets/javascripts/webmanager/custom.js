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
        // templateSelection: formatSelection
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





// var tag_list = $('#article_tag_list').val().split(',');
// var tags = [ ];
// for(i = 0; i < tag_list.length; i++){
//     tags.push({tag: tag_list[i]});
// }
// $('.chips').material_chip({
//     placeholder: 'Enter a tag',
//     secondaryPlaceholder: '+Tag',
//     data: tags
// });
// $('.chips').on('chip.add', function (e, chip) {
//     console.log(this.material_chip(data));
//     var field = $('#article_tag_list');
//     var tags = null;
//     if (field.val() == null) {
//         tags = $('#article_tag_list').val() + chip.tag + ',';
//     } else {
//         tags = $('#article_tag_list').val() + ',' + chip.tag;
//     }
//     $('#article_tag_list').val(tags);
// });

// function chip_data(item, index){
//     var data = '{tag: item}';
//     return data
// }