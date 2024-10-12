import { temporalAPI } from './src/temporal.ts'

// Learn more at https://docs.deno.com/runtime/manual/examples/module_metadata#concepts
if (import.meta.main) {
	console.log(`Web APIs`)
    console.log(`Versions:
	- Deno: ${Deno.version.deno}
	- TypeScript: ${Deno.version.typescript}
	- V8: ${Deno.version.v8}
	`)
	temporalAPI()
}
