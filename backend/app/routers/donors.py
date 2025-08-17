from fastapi import APIRouter, Depends
from sqlalchemy.orm import Session
from .. import schemas, crud, database

router = APIRouter(prefix="/donors", tags=["Donors"])

def get_db():
    db = database.SessionLocal()
    try:
        yield db
    finally:
        db.close()

@router.post("/", response_model=schemas.DonorResponse)
def create_donor(donor: schemas.DonorCreate, db: Session = Depends(get_db)):
    return crud.create_donor(db=db, donor=donor)

@router.get("/", response_model=list[schemas.DonorResponse])
def read_donors(skip: int = 0, limit: int = 10, db: Session = Depends(get_db)):
    return crud.get_donors(db=db, skip=skip, limit=limit)
