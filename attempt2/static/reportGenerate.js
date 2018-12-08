var myPath;
$(document).ready(function(){

    
    document.getElementById('errorMsg').style.display = 'none';
    
    var mIndex = 0;
    var team0 = "";
    var team1 = "";
    var date;
    var sa0 = 0; // sa == shot attempt (off - target)
    var sa1 = 0; 
    var so0 = 0; // so == shot on target
    var so1 = 0;
    var p0 = 0;
    var p1 = 0;
    var t0 = 0;
    var t1 = 0;
    var g0 = 0;
    var g1 = 0;
    var a0 = 0;
    var a1 = 0;
    var c0 = 0;
    var c1 = 0;
    var yc0 = 0;
    var yc1 = 0;
    var rc0 = 0;
    var rc1 = 0;
    var f0 = 0;
    var f1 = 0;
    var of0 = 0;
    var of1 = 0;
    var pn0 = 0;
    var pn1 = 0;
    var b0 = 0;
    var b1 = 0;
    var og0 = 0;
    var og1 = 0;

    $('#generateReport').on('click', function(event){
        document.getElementById('errorMsg').style.display = 'none';
        // event.preventDefault();
        var stats = $('#stats').val().split('\n');
        var statSum = $('#stats').val();
        team0 = $('#team0Name').val();
        team1 = $('#team1Name').val();
        date  = $('#matchDay').val();
        $.cookie( 'statSum', statSum, {expires : 1});
        var cookieWors = $.cookie('statSum');
        console.log(cookieWors);


        // Iterate over all input in textbox counting all stats
        for (var i = 0; i < stats.length; i++)
        {
            if( stats[i] === 'sa 0') {sa0++; continue;}
            if( stats[i] === 'sa 1') {sa1++; continue;}
            if( stats[i] === 'so 0') {so0++; continue;}
            if( stats[i] === 'so 1') {so1++; continue;}
            if( stats[i] === 'p 0') {p0++; continue;}
            if( stats[i] === 'p 1') {p1++; continue;}
            if( stats[i] === 't 0') {t0++; continue;}
            if( stats[i] === 't 1') {t1++; continue;}
            if( stats[i] === 'g 0') {g0++; continue;}
            if( stats[i] === 'g 1') {g1++; continue;}
            if( stats[i] === 'a 0') {a0++; continue;}
            if( stats[i] === 'a 1') {a1++; continue;}
            if( stats[i] === 'c 0') {c0++; continue;}
            if( stats[i] === 'c 1') {c1++; continue;}
            if( stats[i] === 'yc 0') {yc0++; continue;}
            if( stats[i] === 'yc 1') {yc1++; continue;}
            if( stats[i] === 'rc 0') {rc0++; continue;}
            if( stats[i] === 'rc 1') {rc1++; continue;}
            if( stats[i] === 'f 0') {f0++; continue;}
            if( stats[i] === 'f 1') {f1++; continue;}
            if( stats[i] === 'of 0') {of0++; continue;}
            if( stats[i] === 'of 1') {of1++; continue;}
            if( stats[i] === 'p 0') {p0++; continue;}
            if( stats[i] === 'p 1') {p1++; continue;}
            if( stats[i] === 'b 0') {b0++; continue;}
            if( stats[i] === 'b 1') {b1++; continue;}
            if( stats[i] === 'og 0') {og0++; continue;}
            if( stats[i] === 'og 1') {og1++; continue;}
            else{
                document.getElementById('errorMsg').style.display = 'block';
                break;
            }
        }
        //console.log("Team 0 SA: ", sa0);
        //console.log("Team 1 SA: ", sa1);
        

        // Send user to new page with url defined

    });

});