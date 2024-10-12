/// <reference lib="deno.unstable"/>
import { assertExists } from '@std/assert'

Deno.test(function temporalAPI() {
    assertExists(Temporal.Now.instant())
})
