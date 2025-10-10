from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker, declarative_base

# Replace with your actual PostgreSQL credentials
DATABASE_URL = "postgresql+psycopg2://kind_bridge_user:kindLetaBridge@localhost:5432/kind_bridge_db"

# Create engine
engine = create_engine(DATABASE_URL, echo=True)

# SessionLocal class
SessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)

# Base class for models
Base = declarative_base()

# Dependency (for FastAPI routes)
def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()
