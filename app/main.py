from fastapi import FastAPI, Request
import uvicorn
from datetime import datetime


app = FastAPI()


@app.get("/")
async def get_ip(request: Request):
    # client IP
    x_forwarded_for = request.headers.get("x-forwarded-for")
    if x_forwarded_for:
        ip = x_forwarded_for.split(",")[0].strip()
    else:
        ip = request.client.host
    # Current date and time
    now = datetime.now()
    str_datetime = now.strftime("%Y-%m-%d %H:%M:%S")
    return {"timestamp": str_datetime, "client_ip": ip}


if __name__ == "__main__":
    uvicorn.run("main:app", host="127.0.0.1", port=80, reload=False)