from fastapi import FastAPI
from . import models, database
from .routers import donors

# Create database tables
models.Base.metadata.create_all(bind=database.engine)

app = FastAPI()

# Include routers
app.include_router(donors.router)

# Root route
@app.get("/")
def root():
    return {"message": "Welcome to Donor-NGO API"}