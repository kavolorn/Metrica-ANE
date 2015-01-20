package
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.globalization.DateTimeFormatter;
	import flash.system.Capabilities;

	import ru.kavolorn.ane.Metrica;
	import ru.kavolorn.ane.MetricaEvent;

	public class Metrica_Demo extends Sprite
	{
		public function Metrica_Demo()
		{
			loaderInfo.addEventListener(Event.COMPLETE, completeHandler);
		}

		private function completeHandler(event:Event):void
		{
			Metrica.setDebug(true);
			Metrica.getInstance().addEventListener(MetricaEvent.INITIALIZATION_ERROR, initializationErrorHandler);
			Metrica.getInstance().addEventListener(MetricaEvent.INITIALIZATION_SUCCESS, initializationSuccessHandler);
			Metrica.getInstance().initialize('31380', 'eyJsaWNlbnNlIjoie1widGltZXN0YW1wXCI6MTQyMTUyODIwNixcImlkc1wiOltcInJ1Lmthdm9sb3JuLmFuZS5NZXRyaWNhLkRlbW9cIixcImFpci5ydS5rYXZvbG9ybi5hbmUuTWV0cmljYS5EZW1vXCIsXCJydS5rYXZvbG9ybi5hbmUuTWV0cmljYS5EZW1vLmRlYnVnXCIsXCJhaXIucnUua2F2b2xvcm4uYW5lLk1ldHJpY2EuRGVtby5kZWJ1Z1wiXX0iLCJzaWduYXR1cmUiOiJENlNnOVQxWmJyZ25obFFhckRHQ29JcGFoXC9jZzFFQzNSNlwvNzlvNitMUHZmVlZ1c0p6cytzQUpQRFpLSHlaSkpTTXNaOFcyY3VrQlVYcVwvTXRtUGJvSnRqVkZJZXFcL2gwdkJuVXVHMW40eWFBQU12ZnIxK2tWTW01QWpCSmhua1FvSVorN2FHcFwvVVR6Z3F5MFNkNmNnSmYwbkNZSU1QU05jXC9aZXR6Z0hTMWVIUlhUcXVxb1wvdDBldFJLTlhDWlBLTWR5WHd5UnlrZGgzbnQxNHVVN25HaHBLT1J4ODdvYmJTNWM0VFwvQW9rUldveHhaV0grZmM5eUZjQ1lreUZraUNIeXgzMmZ3aFN3MjMwaFpneVZPR0ZmaTViNW04UHdQU21cL2dGc3BxenZZNkZXZE5vdU9XdWZkSEsxWlNTbVIwbVRaV2VrZmZ1UHlMak1wRngwRmtqWmc9PSJ9');
		}

		private function initializationErrorHandler(event:MetricaEvent):void
		{
			trace(event.message);
		}

		private function initializationSuccessHandler(event:MetricaEvent):void
		{
			trace(event.message);
			
			Metrica.getInstance().reportEvent("demo", {
				time : new DateTimeFormatter('en-US').format(new Date()),
				manufacturer : Capabilities.manufacturer
			});
		}
	}
}
