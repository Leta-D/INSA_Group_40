from pydantic import BaseModel

class DonorBase(BaseModel):
    name: str
    email: str

class DonorCreate(DonorBase):
    pass

class DonorResponse(DonorBase):
    id: int

    class Config:
        from_attributes = True
