function ajaxSubmit(form, next) {
    $.ajax({
        type:form.attr("method"),
        url:form.attr("action"),
        dataType:"json",
        data:$(form).serialize(),
        success:function() {
            location = next || form.attr("action");
        }
    });
}

function ajaxSubmitSave(form) {
    form = $(form);
    form.validate({
        errorPlacement: function(error, element) {
            error.appendTo(element.parents(".control-group").find(".help-inline"));
        },
        highlight: function(element, errorClass) {
            $(element).parents(".control-group").addClass(errorClass);
        },
        unhighlight: function(element, errorClass) {
            $(element).parents(".control-group").removeClass(errorClass);
        },
        submitHandler: function(form) {
            ajaxSubmit($(form));
        }
    });
}

function ajaxSubmitDelete(form) {
    $(form).validate({
        submitHandler: function(form) {
            if(confirm('Are you sure you want to delete THAT?')) {
                form = $(form);
                var action = form.attr("action");
                ajaxSubmit(form, action.substring(0, action.lastIndexOf("/")));
            }
        }
    });
}

function ajaxLoadSelect(name, url, options) {
    var selectedValues = $.isArray(options.selected) ? options.selected : [options.selected];
    var valueLabel = options.valueLabel;
    var nameLabel = options.nameLabel;
    var checkToLoad = $.isNumeric(options.check) ? options.check : 1;
    var select = $("select[name=" + name + "]");
    if(select[0].length == checkToLoad) {
        $.getJSON(url, function(json){
            $(json.data).each(function(i, item) {
                var option = "<option value='" + item[valueLabel || "value"] + "'>" + item[nameLabel || "text"] + "</option>";
                var selected;
                for(var j = 0; j < selectedValues.length; j++) {
                    selected = new RegExp("value='" + selectedValues[j] + "'");
                    option = option.replace(selected, "value='" + selectedValues[j] + "' selected");
                }
                select.append(option);
            });
        });
    }
}