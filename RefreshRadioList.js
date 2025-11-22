// The Javascript-function 'RefreshRadioList' (in '/usr/www/js/functions.js') will fill the dropdown with radio-stations in the OpenKarotz UI "Sounds" under "Radio".
// In Free Rabbits OS, this list will be retreived from the FreeRabbits webserver. 
// In the original OpenKarotz, this list is on the filesystem in: /usr/openkarotz/Apps/Streams
// To restore loading the radiolist from the filesystem:
// 1. Open 'functions.js' (located in /usr/www/js)
// 2. Find function 'RefreshRadioList()'
// 3. Replace it with the function-code below (this is the original OpenKarotz script):
// 4. If needed: edit the radiolist (JSON) in /usr/openkarotz/Apps/Streams

function RefreshRadioList()
{
	$('#cbx_stream').empty();
	$('#cbx_stream').prop("disabled", true );
	$('#cbx_stream').append('<option value="-1">Loading streams ...</option>');
    $.blockUI({ message: '<H2><img src="/images/ajax-loader.gif" />&nbsp;Reading tag(s) list'});
	    
		$.getJSON("/cgi-bin/radios_list", function(data) 
		{
			if ( parseInt(data.return) == 0)
			{
				if ( data.streams.length == 0 )
				{
					$('#cbx_stream').empty();
					$('#cbx_stream').prop("disabled", true );
					$('#cbx_stream').append('<option value="-1">No Streams ...</option>');
					$("#btn_sound_play").prop("disabled", true );
					$("#btn_sound_pause").prop("disabled", true )
					$("#btn_sound_stop").prop("disabled", true )
				}
				else
				{
					$('#cbx_stream').prop("disabled", false )
					$("#btn_sound_play").prop("disabled", false );
					$("#btn_sound_pause").prop("disabled", false )
					$("#btn_sound_stop").prop("disabled", false )
					$('#cbx_stream')[0].options.length = 0;
					for (var i = 0; i < data.streams.length; i++)
					{
						$('#cbx_stream').append('<option value="'+ data.streams[i].url +'">'+data.streams[i].name +'</option>');					
					}				
				}
			}
			$.unblockUI();
		});	
		$.unblockUI();	
		$('#cbx_stream').focus()	
}
