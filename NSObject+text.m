//
//  NSObject+text.m
//  ToDoBeta
//
//  Created by MAYUR on 10/04/15.
//  Copyright (c) 2015 MAYUR. All rights reserved.
//

#import "NSObject+text.h"

@implementation NSObject (text)

// NSString *phoneNumber = [@"tel://" stringByAppendingString:@"9414481799"];
//[[UIApplication sharedApplication] openURL:[NSURL URLWithString:phoneNumber]];


- (void)opencontacts {
    
    ABPeoplePickerNavigationController *contactpicker = [[ABPeoplePickerNavigationController alloc] init];
    contactpicker.peoplePickerDelegate = self;
    [self presentViewController:contactpicker animated:YES completion:nil];
}

- (void)peoplePickerNavigationControllerDidCancel:
(ABPeoplePickerNavigationController *)peoplePicker {
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (void)peoplePickerNavigationController:(ABPeoplePickerNavigationController *)peoplePicker didSelectPerson:(ABRecordRef)person
{
    ABMultiValueRef phone = (ABMultiValueRef) ABRecordCopyValue(person, kABPersonPhoneProperty);
    CFStringRef phoneID = ABMultiValueCopyValueAtIndex(phone, 0);
    name = (__bridge_transfer NSString*)ABRecordCopyValue(person,kABPersonFirstNameProperty);
    number=(__bridge NSString *)(phoneID);
    txtdesc.text=[NSString stringWithFormat:@"Call %@  %@",name,number];
    CFRelease(phoneID);
    CFRelease(phone);
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

-(BOOL)peoplePickerNavigationController:(ABPeoplePickerNavigationController *)peoplePicker shouldContinueAfterSelectingPerson:(ABRecordRef)person property:(ABPropertyID)property identifier:(ABMultiValueIdentifier)identifier{
    return NO;
}



- (void)addContactFromPhoneContacts:(id)sender
{
    ABPeoplePickerNavigationController *contactpicker = [[ABPeoplePickerNavigationController alloc] init];
    contactpicker.peoplePickerDelegate = self;
    [self presentViewController:contactpicker animated:YES completion:nil];
}

@end
