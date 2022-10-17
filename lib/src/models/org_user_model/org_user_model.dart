class OrgUser {
  String OrganizationName;
  String OrganizationShortName;
  String ContactNo;
  String Email;
  String Address;
  String? imgUrl;
  String? userRole ;
  bool? newUser = true;
  List<String>? offeringAreas;

  OrgUser({required this.OrganizationName,
      required this.OrganizationShortName,
      required this.ContactNo,
      required this.Email,
      required this.Address,
      this.imgUrl,
      this.userRole = 'org',
      this.newUser = true,
      this.offeringAreas});


  Map<String, dynamic> toJSON() =>
      {
        'OrganizationName': this.OrganizationName,
        'OrganizationShortName': this.OrganizationShortName,
        'ContactNo': this.ContactNo,
        'Email': this.Email,
        'Address': this.Address,
        'imgUrl': this.imgUrl,
        'userRole': this.userRole,
        'newUser': this.newUser,
        'offeringAreas': this.offeringAreas
      };
}