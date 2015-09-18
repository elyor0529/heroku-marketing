/**
 * Created by elyor on 8/30/2015.
 */
$(document).ready(function () {

    /*
     * form validation
     * */
    $("#form1").validate();

    /*
     * select2 control
     * */

    $(".select2-control").select2({
        theme: "classic",
        language: "en",
        placeholder: "Please a select",
        allowClear: true
    });

});