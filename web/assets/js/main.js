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

    $(".select2-control").select2();

    /*
     * date picker
     * */
    $('.datepicker').datepicker({
        autoclose: 1,
        clearBtn: 1,
        format: "dd-mm-yyyy"
    });

});