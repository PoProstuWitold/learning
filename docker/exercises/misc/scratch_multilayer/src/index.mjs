import os from 'node:os'
import express from 'express'

const app = express()
const port = 8080
const version = process.env.VERSION || 'No version defined'

app.get('/', (req, res) => {
    const hostname = os.hostname()
    const ip = req.socket.localAddress

    res.json({ hostname, ip, version })
})

app.listen(port, () => {
    console.log(`Server running on port ${port}. GLHF!`)
})
