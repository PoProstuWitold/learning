/// <reference lib="deno.unstable"/>

export const temporalAPI = () => {
	console.log('Temporal.Now.Instant', Temporal.Now.instant())
	console.log('Temporal.Now.ZonedDateTime', Temporal.Now.zonedDateTimeISO())
	console.log('Temporal.Now.PlainDate', Temporal.Now.plainDateISO())
	const date = Temporal.Now.plainDateISO().toZonedDateTime('Europe/Warsaw')
	console.log('date', date)
}