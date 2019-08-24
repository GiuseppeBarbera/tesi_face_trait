//TODO
//leftFront = $('#drag_1566524115341').children('.shape').children('.ui-wrapper').offset().left - $('#front_img').offset().left;
//topFront = $('#drag_1566524115341').children('.shape').children('.ui-wrapper').offset().top - $('#front_img').offset().top;
//leftFront = leftFront * actualZoomFront;
//topFront = topFront * actualZoomFront;
//

var selectedTab = 'front';
//front variable
var actualDegreeFront = 0;//degree front image
var actualZoomFront = 1.0;//zoom front image
var actualXpositionFront = 0;//position x front image
var actualYpositionFront = 0;//position y front image
var globalTransformStringFront = "translate(0px,0px) scale(1.0) rotate(0deg)"; //default string css, help me to set a default value
var listShapeFront = {}; //list of shapes front (shape is an element which can be positioned upon image
var listShapeFrontByType = {};

//profile variable
var actualDegreeProfile = 0;
var actualZoomProfile = 1.0;
var actualXpositionProfile = 0;
var actualYpositionProfile = 0;
var globalTransformStringProfile = "translate(0px,0px) scale(1.0) rotate(0deg)";
var listShapeProfile = {};
var listShapeProfileByType = {};

//shared variable
var rotateString = "rotate($$DEGREE$$deg)";//this is string with naming convention to help me to create css string. I just replace $$DEGREE$$ with a value
var zoomString = "scale($$ZOOM$$)";//this is string with naming convention to help me to create css string. I just replace $$ZOOM$$ with a value
var translateString = "translate($$X$$px, $$Y$$px)";//this is string with naming convention to help me to create css string. I just replace $$X$$ and $$Y$$ with a values


//This code will be executed when page is ready
$(document).ready(function(){
    //It retry metadata of front image
    getMetadata('front');
    //It retry metadata of profile image
    getMetadata('profile');
});

//event fired when click on delete icon
$(document).on("click", ".delete-shape",function(event) {
    //retry class of element
    var classes = $(event.currentTarget).parent().attr('class');

    //check if is front or profile
    if(classes.includes('front')){
        var type = 'front';
    }else if(classes.includes('profile')){
        var type = 'profile';
    }
    //delete icon from page and from list
    deleteShape(event, type);
});

//event fired when click a shape from front image
$( ".draggable_front_creator" ).click(function(event) {
    createShape(null, null, event, 'front');
});

//event fired when click a shape from front image
$( ".draggable_profile_creator" ).click(function(event) {
    createShape(null, null, event, 'profile');
});

//event fired when click rotate on action bar
$( ".rotate_button" ).click(function() {
    var idButton = $(this).attr('id');
    if(idButton == 'r_rotate_front') {
        actualDegreeFront++;
    }else  if(idButton == 'l_rotate_front') {
        actualDegreeFront--;
    }else if(idButton == 'r_rotate_profile') {
        actualDegreeProfile++;
    }else  if(idButton == 'l_rotate_profile') {
        actualDegreeProfile--;
    }

    if(idButton.split('_')[2] == 'front') {
        setTransformCss('front_img', 'front');
    }else if(idButton.split('_')[2] == 'profile'){
        setTransformCss('profile_img', 'profile');
    }
});

//event fired when click zoom on action bar
$( ".zoom_button" ).click(function() {
    var idButton = $(this).attr('id');
    if(idButton == 'plus_zoom_front') {
        actualZoomFront += 0.1;
    }else  if(idButton == 'minus_zoom_front') {
        actualZoomFront -= 0.1;
    }else if(idButton == 'plus_zoom_profile') {
        actualZoomProfile += 0.1;
    }else  if(idButton == 'minus_zoom_profile') {
        actualZoomProfile -= 0.1;
    }

    if(idButton.split('_')[2] == 'front') {
        setTransformCss('front_img', 'front');
    }else if(idButton.split('_')[2] == 'profile'){
        setTransformCss('profile_img', 'profile');
    }

});

//event fired when click arrow on action bar
$( ".move_button" ).click(function() {
    var idButton = $(this).attr('id');
    if(idButton == 'move_right_front'){
        actualXpositionFront += 5;
    }else if(idButton == 'move_left_front'){
        actualXpositionFront -= 5;
    }else if(idButton == 'move_up_front'){
        actualYpositionFront -= 5;
    }if(idButton == 'move_down_front'){
        actualYpositionFront += 5;
    }else if(idButton == 'move_right_profile'){
        actualXpositionProfile += 5;
    }else if(idButton == 'move_left_profile'){
        actualXpositionProfile -= 5;
    }else if(idButton == 'move_up_profile'){
        actualYpositionProfile -= 5;
    }if(idButton == 'move_down_profile'){
        actualYpositionProfile += 5;
    }

    if(idButton.split('_')[2] == 'front') {
        setTransformCss('front_img', 'front');
    }else if(idButton.split('_')[2] == 'profile'){
        setTransformCss('profile_img', 'profile');
    }
});

//event fired when click upload on front image
$('#upload_front_form').on('submit', function(event){
    onUploadAction(this, event, 'front')
});

//event fired when click upload on profile image
$('#upload_profile_form').on('submit', function(event){
    onUploadAction(this, event, 'profile')
});

//event fired when click save on front image
$('#save_front_metadata').on('click', function(event){
    onSaveAction(this, event, 'front')
});

//event fired when click save on profile image
$('#save_profile_metadata').on('click', function(event){
    onSaveAction(this, event, 'profile')
});

//event fired when click check button
$( ".magic_profile" ).click(function(event) {
    onCheckMagicAction(this, event, 'profile', $(event.currentTarget).data('morph-type-id'));
});

//event fired when click check button
$( ".magic_front" ).click(function(event) {
    onCheckMagicAction(this, event, 'front', $(event.currentTarget).data('morph-type-id'));
});

//rotate image identified from 'idImg' of angle 'degree'
function rotate(idImg, degree){
    //rotate(13deg)
    var rotateTransformSting = rotateString.replace('$$DEGREE$$', degree % 360);
    return rotateTransformSting;
}

//rotate image identified from 'idImg' of 'zoom' value
function zoom(idImg, zoom){
    var zoomTransformationString = zoomString.replace("$$ZOOM$$", zoom);
    return zoomTransformationString;
    ///$( "#" + idImg ).css( "transform", "scale(" + actualZoom + ")");
    //$( "#" + idImg ).css( "-ms-transform", "scale(" + actualZoom +")");
    //$( "#" + idImg ).css( "-moz-transform", "scale(" + actualZoom +")");
    //$( "#" + idImg ).css( "-webkit-transform", "scale(" + actualZoom  +")");
    //$( "#" + idImg ).css( "-o-transform", "scale(" + actualZoom +")");
}

//translate image identified from 'idImg' to xPos, yPos
function translate(idImg, xPos, yPos){
    var translateTransformateString = translateString.replace("$$X$$", xPos).replace("$$Y$$", yPos);
    return translateTransformateString;
    //$( "#" + idImg ).css( "transform", "translate(" + actualXpositionFront + "px" + ","  + actualYpositionFront + "px" + ")");
}

//set variable to change css. An other method use these variable and change css
function setTransformCss(idImg, type){
    if(type == 'front') {
        var rotateStr = rotate(idImg, actualDegreeFront);
        var zoomStr = zoom(idImg, actualZoomFront);
        var translateStr =  translate(idImg, actualXpositionFront, actualYpositionFront);
        globalTransformStringFront = rotateStr + ' ' + zoomStr + ' ' + translateStr;
        applyTransformCss(idImg, globalTransformStringFront);
    }else if(type == 'profile'){
        var rotateStr = rotate(idImg, actualDegreeProfile);
        var zoomStr = zoom(idImg, actualZoomProfile);
        var translateStr =  translate(idImg, actualXpositionProfile, actualYpositionProfile);
        globalTransformStringProfile = rotateStr + ' ' + zoomStr + ' ' + translateStr;
        applyTransformCss(idImg, globalTransformStringProfile);
    }
}

//read variable setted from method above and set css
function applyTransformCss(idImg, globalTransformString) {
    $( "#" + idImg ).css( "transform", globalTransformString);
    $( "#" + idImg ).css( "-ms-transform", globalTransformString);
    $( "#" + idImg ).css( "-moz-transform", globalTransformString);
    $( "#" + idImg ).css( "-webkit-transform", globalTransformString);
    $( "#" + idImg ).css( "-o-transform", globalTransformString);
}

//set position of shape
function setPositionShape(shapeId, top, left) {
    var element = $('#' + shapeId);
    element.css({'top': parseFloat(top), 'left' : parseFloat(left), position : 'absolute'});
}

//retry metadata helpful to reposition the shapes
function getMetadata(type){
    var idProject = $("#project_id").val();
    $.ajaxSetup({
        headers: {
            'X-CSRF-TOKEN': $("#csrf_token").val()
        }
    });
    $.ajax({
        url:"../../projects/" + idProject + '/metadata/' + type,
        method:"GET",
        success:function(data)
        {
            if(type == 'front'){
                if(data.global != undefined) {
                    globalTransformStringFront = data.global;
                }
                if(data.degree != undefined) {
                    actualDegreeFront = data.degree;
                }
                if(data.zoom != undefined) {
                    actualZoomFront = data.zoom;
                }
                if(data.x != undefined) {
                    actualXpositionFront = data.x;
                }
                if(data.y != undefined) {
                    actualYpositionFront = data.y;
                }
            }else if(type == 'profile'){
                if(data.global != undefined) {
                    globalTransformStringProfile = data.global;
                }
                if(data.degree != undefined) {
                    actualDegreeProfile = data.degree;
                }
                if(data.zoom != undefined) {
                    actualZoomProfile = data.zoom;
                }
                if(data.x != undefined) {
                    actualXpositionProfile = data.x;
                }
                if(data.y != undefined) {
                    actualYpositionProfile = data.y;
                }
            }


            //manage shape
            if(data.shapes != undefined) {
                var shapes = data.shapes;

                $.each(shapes, function (key, value) {
                    var id = key;
                    var shapeInfo = value;
                    createShape(id, shapeInfo, null, type)
                });
            }

            if(type == 'front') {
                setTransformCss('front_img', 'front');
            }else if (type == 'profile'){
                setTransformCss('profile_img', 'profile');
            }
        }
    })
}

function onUploadAction(obj, event, type){
    event.preventDefault();
    var idProject = $("#project_id").val();
    $.ajax({
        url:"../../projects/" + idProject + '/upload/' + type,
        method:"POST",
        data:new FormData(obj),
        dataType:'JSON',
        contentType: false,
        cache: false,
        processData: false,
        success:function(data)
        {
            if(data.error != undefined){
                alert(data.error);
            }

            location.reload();
        }
    })
}

function onSaveAction(obj, event, type){
    event.preventDefault();
    var idProject = $("#project_id").val();
    $.ajaxSetup({
        headers: {
            'X-CSRF-TOKEN': $("#csrf_token").val()
        }
    });

    var data = {
        global_front: globalTransformStringFront, x_front : actualXpositionFront, y_front : actualYpositionFront, zoom_front : actualZoomFront, degree_front : actualDegreeFront,shapes_front : listShapeFront,
        global_profile: globalTransformStringProfile, x_profile : actualXpositionProfile, y_profile : actualYpositionProfile, zoom_profile : actualZoomProfile, degree_profile : actualDegreeProfile, shapes_profile: listShapeProfile
    };

    $.ajax({
        //url:"../../projects/" + idProject + '/save/' + type,
        url:"../../projects/" + idProject + '/save/' + 'all',
        method:"POST",
        data: data,
        processData: true,
        success:function(data)
        {
            alert("Data saved correctly");
            location.reload();
        }
    })
}

function onCheckMagicAction(obj, event, type, morphTypeId){
    event.preventDefault();
    var idProject = $("#project_id").val();
    $.ajaxSetup({
        headers: {
            'X-CSRF-TOKEN': $("#csrf_token").val()
        }
    });
debugger;
    if(type == 'front') {
        var listShape = listShapeFrontByType[morphTypeId];
        var listShapeOfficial = listShapeFront;
    }else if(type == 'profile'){
        var listShape = listShapeProfileByType[morphTypeId];
        var listShapeOfficial = listShapeProfile;
    }

    var listDuplicate = new Array();
    var listAux = new Array();
    for (var k in listShape){
        if(listDuplicate[listShape[k].linked_to] == undefined) {
            listDuplicate[listShape[k].linked_to] = 1;
            listAux.push(k);
        }
    }

    //retry element from official list
    var sendList = new Array();
    for(var i in listAux) {
        for (var k in listShapeOfficial) {
            if (listAux[i] == listShapeOfficial[k].id_shape) {
                sendList[k] = listShapeOfficial[k];
            }
        }
    }

    var data = {
        listShapes : sendList, type : type
    };

    $.ajax({
        url:"../../check/" + idProject,
        method:"POST",
        data: data,
        processData: true,
        success:function(data)
        {
            alert("Data saved correctly");
        }
    })
}

function createShape(shapeId, shapeInfo, event, type){

    var newWrapperImg = $('<div></div>', {
        class : "shape"
    });

    if(event != undefined){
        var imgSrc = $(event.currentTarget).attr('src');
        var description = $(event.currentTarget).attr('title');
    }else{
        var imgSrc = $('#morph_' + type + '_' + shapeInfo.id_shape).attr('src');
        var description = $('#morph_' + type + '_' + shapeInfo.id_shape).attr('title');
    }
    var newDraggableShape = $('<img/>', {
        class : "shape img-shape",
        src : imgSrc,
        title : description
    });

    if(shapeId == undefined) {
        var id = "drag_" + new Date().getTime();
        var morphTypeId = $(event.currentTarget).data('morph-type');
        var morphId = $(event.currentTarget).data('morph');
    }else{
        var id = shapeId;
        var morphTypeId = shapeInfo.morph_type_id;
        var morphId = shapeInfo.morph_id;
    }

    //check if shape already added
    var auxList = type == 'front' ? listShapeFront : listShapeProfile;
    for (var k in auxList){
        if(auxList[k].morph_id == morphId){
            alert("Cannot add a duplicate elemente. It already exist on workspace!");
            return;
        }
    };

    $(newWrapperImg).prepend(newDraggableShape)

    var newDraggableDiv = $('<div></div>', {
        class : "draggable " + type,
        id : id,
        "data-morph-type-id" : morphTypeId,
        "data-morph-id" : morphId
    }).draggable({
        //this will be executed when element will be translated
        drag: function() {
            var position = $(this).position();
            var xPos = position.left;
            var yPos = position.top;

            var id = $(this).attr('id');
            var classes = $(this).attr('class');

            if(classes.includes('front')){
                if (listShapeFront[id] != undefined) {
                    listShapeFront[id].x = xPos;
                    listShapeFront[id].y = yPos;

                    //coordinates respect image
                    leftFront = $('#' + id).children('.shape').children('.ui-wrapper').offset().left - $('#front_img').offset().left;
                    topFront = $('#' + id).children('.shape').children('.ui-wrapper').offset().top - $('#front_img').offset().top;
                    leftFront = leftFront * actualZoomFront;
                    topFront = topFront * actualZoomFront;
                    listShapeFront[id].left = leftFront;
                    listShapeFront[id].top = topFront;
                }
            }else if(classes.includes('profile')){
                if (listShapeProfile[id] != undefined) {
                    listShapeProfile[id].x = xPos;
                    listShapeProfile[id].y = yPos;

                    //coordinates respect image
                    leftProfile = $('#' + id).children('.shape').children('.ui-wrapper').offset().left - $('#profile_img').offset().left;
                    topProfile = $('#' + id).children('.shape').children('.ui-wrapper').offset().top - $('#profile_img').offset().top;
                    leftProfile = leftFront * actualZoomProfile;
                    topProfile = topProfile * actualZoomProfile;
                    listShapeProfile[id].left = leftProfile;
                    listShapeProfile[id].top = topProfile;
                }
            }



        }
    });

    $(newDraggableDiv).prepend(newWrapperImg);

    var trashButton = $('<button></button>',{
        class : 'delete-shape'
    });
    var trashIcon = $('<i></i>',{
        class : 'fas fa-trash-alt delete-shape',
        'aria-hidden' : 'true'
    });
    //trashButton.append(trashIcon);

    $(newDraggableDiv).prepend(trashIcon);

    if(type == 'front') {
        $('.draggable_front_container').append(newDraggableDiv);
    }else if(type == 'profile'){
        $('.draggable_profile_container').append(newDraggableDiv);
    }

    newDraggableShape.resizable({
        //aspectRatio: 1/1,
        handles: "s,e,se",
        aspectRatio: true,
        stop: function(event, ui) {
            var w = ui.size.width;
            var h = ui.size.height;
            var id = $(this).parent().parent().attr('id');
            var classes = $(this).parent().parent().attr('class');

            if(classes.includes('front')){
                listShapeFront[id].w = w;
                listShapeFront[id].h = h;
            }else if(classes.includes('profile')){
                listShapeProfile[id].w = w;
                listShapeProfile[id].h = h;
            }
        }
    });

    var position = $('#' + id).position();

    xPos = position.left;
    yPos = position.top;


    if(shapeInfo != undefined) {
        xPos = shapeInfo.x;
        yPos = shapeInfo.y;
        setPositionShape(shapeId, yPos, xPos);

        if (shapeInfo.degree != undefined) {
            degree = shapeInfo.degree;
        }else{
            degree = 0;
        }

        if(shapeInfo.h != undefined && shapeInfo.w != undefined){
            $($('#' + id).find('.ui-wrapper')[0]).css('width', shapeInfo.w );
            $($('#' + id).find('.ui-wrapper')[0]).css('height', shapeInfo.h );
            $($('#' + id).find('img')[0]).css('width', shapeInfo.w );
            $($('#' + id).find('img')[0]).css('height', shapeInfo.h );

            var h = shapeInfo.h;
            var w = shapeInfo.w;
        }else{
            var h = 30;
            var w = 30;
        }
    }else{
        degree = 0;
    }

    if(event != undefined){
        var idShape = $(event.currentTarget).attr('id').split('_')[2];
        var morphTypeId = $(event.currentTarget).data('morph-type')+'';
        var morphId = $(event.currentTarget).data('morph')+'';
        var linkedTo = $(event.currentTarget).data('linked-to');
        var description = $(event.currentTarget).attr('title');
    }else{
        var idShape = shapeInfo.id_shape;
        var morphTypeId = shapeInfo.morph_type_id+'';
        var morphId = shapeInfo.morph_id+'';
        var linkedTo = shapeInfo.linked_to;
        var description = shapeInfo.description;
    }

    if(type == 'front') {
        listShapeFront[id] = {x: xPos, y: yPos, degree: parseFloat(degree), h: h, w: w, id_shape: idShape, morph_type_id : morphTypeId, linked_to : linkedTo, morph_id : morphId};

        var count = listShapeFrontByType[morphTypeId] != undefined && listShapeFrontByType[morphTypeId].count != undefined ? listShapeFrontByType[morphTypeId].count +1 : 1;
        if(listShapeFrontByType[morphTypeId] == undefined){
            listShapeFrontByType[morphTypeId] = new Array();
            listShapeFrontByType[morphTypeId][idShape] = {linked_to : linkedTo};
        }else{
            listShapeFrontByType[morphTypeId][idShape] = {linked_to : linkedTo};
        }

        listShapeFrontByType[morphTypeId].count = count;
    }else if(type == 'profile'){
        listShapeProfile[id] = {x: xPos, y: yPos, degree: parseFloat(degree), h: h, w: w, id_shape: idShape, morph_type_id : morphTypeId, linked_to : linkedTo, morph_id : morphId};

        var count = listShapeProfileByType[morphTypeId] != undefined && listShapeProfileByType[morphTypeId].count != undefined  ? listShapeProfileByType[morphTypeId].count +1 : 1;
        if(listShapeProfileByType[morphTypeId] == undefined){
            listShapeProfileByType[morphTypeId] = new Array();
            listShapeProfileByType[morphTypeId][idShape] = {linked_to : linkedTo};
        }else{
            listShapeProfileByType[morphTypeId][idShape] = {linked_to : linkedTo};
        }

        listShapeProfileByType[morphTypeId].count = count;

    }

    newWrapperImg.rotatable({angle : parseFloat(degree)});

}

//delete shape from page and from variable list
function deleteShape(event, type) {
    var id = $(event.currentTarget).parent().attr('id');
    var morphTypeId = $(event.currentTarget).parent().data('morph-type-id')+'';
    var morphId = $(event.currentTarget).parent().data('morph-id')+'';
    $(event.currentTarget).parent().remove();
    if(type == 'front') {
        delete listShapeFront[id];
        delete listShapeFrontByType[morphTypeId][morphId];
        listShapeFrontByType[morphTypeId].count = listShapeFrontByType[morphTypeId].count -1;
    }else if(type == 'profile'){
        delete listShapeProfile[id];
        delete listShapeProfileByType[morphTypeId][morphId];
        listShapeProfileByType[morphTypeId].count = listShapeProfileByType[morphTypeId].count -1;
    }
}
