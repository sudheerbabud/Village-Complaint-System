package com.gated.model;

public class Complaint {
    
    private int complaintId;
    private String personName;
    private String email;
    private int flatNumber;
    private String complaints;
    private String phoneNumber;
    private String status;

    
    public Complaint() {
        super();
    }

    
    public Complaint(String personName, String email, int flatNumber, String complaints,String phoneNumber, int complaintId) {
        super();
        this.complaintId = complaintId;
        this.personName = personName;
        this.email = email;
        this.flatNumber = flatNumber;
        this.complaints = complaints;
        this.phoneNumber = phoneNumber;
    }

   
    public Complaint(int complaintId, String personName, String complaints, String status) {
        super();
        this.complaintId = complaintId;
        this.personName = personName;
        this.complaints = complaints;
        this.status = status;
    }

    
    public Complaint(int complaintId, String status) {
        super();
        this.complaintId = complaintId;
        this.status = status;
    }

   
    public Complaint(String complaints) {
        super();
        this.complaints = complaints;
    }

   
    public int getComplaintId() {
        return complaintId;
    }

    public void setComplaintId(int complaintId) {
        this.complaintId = complaintId;
    }

    public String getPersonName() {
        return personName;
    }

    public void setPersonName(String personName) {
        this.personName = personName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getFlatNumber() {
        return flatNumber;
    }

    public void setFlatNumber(int flatNumber) {
        this.flatNumber = flatNumber;
    }

    public String getComplaints() {
        return complaints;
    }

    public void setComplaints(String complaints) {
        this.complaints = complaints;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Complaint [complaintId=" + complaintId + ", personName=" + personName + ", email=" + email
                + ", flatNumber=" + flatNumber + ", complaints=" + complaints + ", phoneNumber=" + phoneNumber
                + ", status=" + status + "]";
    }
}
