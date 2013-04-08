/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
$(function() {    
    $("div.apple_pagination a").click(function() {
        $.get(this.href, null, null, "script")
        return false;
    });
});

