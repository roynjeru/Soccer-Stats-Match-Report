var myPath;
$(document).ready(function(){

    
    document.getElementById('errorMsg').style.display = 'none';

    var isValid = "1";
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
        //console.log(cookieWors);


        // Iterate over all input in textbox counting all stats
        for (var i = 0; i < stats.length; i++)
        {
            if( stats[i] === 'sa 0') {sa0++; continue;}
            else if( stats[i] === 'sa 1') {sa1++; continue;}
            else if( stats[i] === 'so 0') {so0++; continue;}
            else if( stats[i] === 'so 1') {so1++; continue;}
            else if( stats[i] === 'p 0') {p0++; continue;}
            else if( stats[i] === 'p 1') {p1++; continue;}
            else if( stats[i] === 't 0') {t0++; continue;}
            else if( stats[i] === 't 1') {t1++; continue;}
            else if( stats[i] === 'g 0') {g0++; continue;}
            else if( stats[i] === 'g 1') {g1++; continue;}
            else if( stats[i] === 'a 0') {a0++; continue;}
            else if( stats[i] === 'a 1') {a1++; continue;}
            else if( stats[i] === 'c 0') {c0++; continue;}
            else if( stats[i] === 'c 1') {c1++; continue;}
            else if( stats[i] === 'yc 0') {yc0++; continue;}
            else if( stats[i] === 'yc 1') {yc1++; continue;}
            else if( stats[i] === 'rc 0') {rc0++; continue;}
            else if( stats[i] === 'rc 1') {rc1++; continue;}
            else if( stats[i] === 'f 0') {f0++; continue;}
            else if( stats[i] === 'f 1') {f1++; continue;}
            else if( stats[i] === 'of 0') {of0++; continue;}
            else if( stats[i] === 'of 1') {of1++; continue;}
            else if( stats[i] === 'pn 0') {p0++; continue;}
            else if( stats[i] === 'pn 1') {pn1++; continue;}
            else if( stats[i] === 'b 0') {b0++; continue;}
            else if( stats[i] === 'b 1') {b1++; continue;}
            else if( stats[i] === 'og 0') {og0++; continue;}
            else if( stats[i] === 'og 1') {og1++; continue;}
            else{
                document.getElementById('errorMsg').style.display = 'block';
                event.preventDefault();
                isValid = "1";
                break;
            }
        }

        // Store stats 
        
        
        if(isValid === "1")
        {
            var statUrl = team0 + "/" + team1 + "/" + date + "/sa0: " + sa0 + "/sa1: " + sa1 + "/so0: " + so0 + "/so1: " + so1 + "/p0: " + p0 + "/p1: " + p1 + "/t0: " +
                t0 + "/t1: " + t1 + "/g0: " + g0 + "/g1: " + g1 + "/a0: " + a0 + "/a1: " + a1 + "/c0: " + c0 + "/c1: " + c1 + "/yc0: " + yc0 + "/yc1: " + yc1 + "/rc0: " + rc0 + "/rc1: " + 
                rc1 + "/f0: " + f0 + "/f1: " + f1 + "/of0: " + of0 + "/of1: " + of1 + "/pn0: " + pn0 + "/pn1: " + pn1 + "/b0: " + b0 + "/b1: " + b1 + "/og0: " + og0 + "/og1: " + og1;
            $.cookie( 'statUrl', statUrl, {expires : 1});
            $.cookie( 'SOCC_date', date);
            $.cookie( 'SOCC_team0', team0);
            $.cookie( 'SOCC_team1', team1);
            $.cookie( 'SOCC_sa0', sa0);
            $.cookie( 'SOCC_sa1', sa1);
            $.cookie( 'SOCC_so0', so0);
            $.cookie( 'SOCC_so1', so1);
            $.cookie( 'SOCC_p0', p0);
            $.cookie( 'SOCC_p1', p1);
            $.cookie( 'SOCC_t0', t0);
            $.cookie( 'SOCC_t1', t1);
            $.cookie( 'SOCC_g0', g0);
            $.cookie( 'SOCC_g1', g1);
            $.cookie( 'SOCC_a0', a0);
            $.cookie( 'SOCC_a1', a1);
            $.cookie( 'SOCC_c0', c0);
            $.cookie( 'SOCC_c1', c1);
            $.cookie( 'SOCC_yc0', yc0);
            $.cookie( 'SOCC_yc1', yc1);
            $.cookie( 'SOCC_rc0', rc0);
            $.cookie( 'SOCC_rc1', rc1);
            $.cookie( 'SOCC_f0', f0);
            $.cookie( 'SOCC_f1', f1);
            $.cookie( 'SOCC_of0', of0);
            $.cookie( 'SOCC_of1', of1);
            $.cookie( 'SOCC_pn0', pn0);
            $.cookie( 'SOCC_pn1', pn1);
            $.cookie( 'SOCC_b0', b0);
            $.cookie( 'SOCC_b1', b1);
            $.cookie( 'SOCC_og0', og0);
            $.cookie( 'SOCC_og1', og1);
        }
        isValid = "1";
    });

});