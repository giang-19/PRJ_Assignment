package model;

public class Address {
    private int addressId;
    private int accountId;
    private String addressName;
    private String phone;

    public Address() {
    }

    public Address(int addressId, int accountId, String addressName, String phone) {
        this.addressId = addressId;
        this.accountId = accountId;
        this.addressName = addressName;
        this.phone = phone;
    }

    public int getAddressId() {
        return addressId;
    }

    public void setAddressId(int addressId) {
        this.addressId = addressId;
    }

    public int getAccountId() {
        return accountId;
    }

    public void setAccountId(int accountId) {
        this.accountId = accountId;
    }

    public String getAddressName() {
        return addressName;
    }

    public void setAddressName(String addressName) {
        this.addressName = addressName;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }
    
}
