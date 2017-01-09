require 'hashie'
require_relative './pathSegment'

  class Restapi < PathSegment
    def segment
      'restapi'
    end
    def oauth()
      Oauth.new(@rc, self)
    end
    def account(id)
      Account.new(@rc, self, id)
    end
    def clientInfo()
      ClientInfo.new(@rc, self)
    end
    def dictionary()
      Dictionary.new(@rc, self)
    end
    def numberParser()
      NumberParser.new(@rc, self)
    end
    def numberPool()
      NumberPool.new(@rc, self)
    end
    def subscription(id = nil)
      Subscription.new(@rc, self, id)
    end
  def list(params = nil)
    Hashie::Mash.new JSON.parse(getResponse(params))
  end

  def get(params = nil)
    Hashie::Mash.new JSON.parse(getResponse(params))
  end

  end
  class Oauth < PathSegment
    def segment
      'oauth'
    end
    def authorize()
      Authorize.new(@rc, self)
    end
    def revoke()
      Revoke.new(@rc, self)
    end
    def token()
      Token.new(@rc, self)
    end
  end
  class Authorize < PathSegment
    def segment
      'authorize'
    end
  def post(payload, params = nil)
    Hashie::Mash.new JSON.parse(postResponse(payload, params))
  end

  end
  class Revoke < PathSegment
    def segment
      'revoke'
    end
  def post(payload, params = nil)
    Hashie::Mash.new JSON.parse(postResponse(payload, params))
  end

  end
  class Token < PathSegment
    def segment
      'token'
    end
  def post(payload, params = nil)
    Hashie::Mash.new JSON.parse(postResponse(payload, params))
  end

  end
  class Account < PathSegment
    def segment
      'account'
    end
    def activeCalls()
      ActiveCalls.new(@rc, self)
    end
    def businessAddress()
      BusinessAddress.new(@rc, self)
    end
    def callLog(id = nil)
      CallLog.new(@rc, self, id)
    end
    def department(id)
      Department.new(@rc, self, id)
    end
    def device(id = nil)
      Device.new(@rc, self, id)
    end
    def dialingPlan()
      DialingPlan.new(@rc, self)
    end
    def extension(id = nil)
      Extension.new(@rc, self, id)
    end
    def order(id = nil)
      Order.new(@rc, self, id)
    end
    def phoneNumber(id = nil)
      PhoneNumber.new(@rc, self, id)
    end
    def recording(id)
      Recording.new(@rc, self, id)
    end
    def serviceInfo()
      ServiceInfo.new(@rc, self)
    end
  def get(params = nil)
    Hashie::Mash.new JSON.parse(getResponse(params))
  end

  end
  class ActiveCalls < PathSegment
    def segment
      'active-calls'
    end
  def list(params = nil)
    Hashie::Mash.new JSON.parse(getResponse(params))
  end

  end
  class BusinessAddress < PathSegment
    def segment
      'business-address'
    end
  def get(params = nil)
    Hashie::Mash.new JSON.parse(getResponse(params))
  end

  def put(payload, params = nil)
    Hashie::Mash.new JSON.parse(putResponse(payload, params))
  end

  end
  class CallLog < PathSegment
    def segment
      'call-log'
    end
  def list(params = nil)
    Hashie::Mash.new JSON.parse(getResponse(params))
  end

  def get(params = nil)
    Hashie::Mash.new JSON.parse(getResponse(params))
  end

  def delete(params = nil)
    deleteResponse(params)
  end

  end
  class Department < PathSegment
    def segment
      'department'
    end
    def members()
      Members.new(@rc, self)
    end
  end
  class Members < PathSegment
    def segment
      'members'
    end
  def list(params = nil)
    Hashie::Mash.new JSON.parse(getResponse(params))
  end

  end
  class Device < PathSegment
    def segment
      'device'
    end
  def list(params = nil)
    Hashie::Mash.new JSON.parse(getResponse(params))
  end

  def get(params = nil)
    Hashie::Mash.new JSON.parse(getResponse(params))
  end

  end
  class DialingPlan < PathSegment
    def segment
      'dialing-plan'
    end
  def list(params = nil)
    Hashie::Mash.new JSON.parse(getResponse(params))
  end

  end
  class Extension < PathSegment
    def segment
      'extension'
    end
    def activeCalls()
      ActiveCalls.new(@rc, self)
    end
    def addressBookSync()
      AddressBookSync.new(@rc, self)
    end
    def addressBook()
      AddressBook.new(@rc, self)
    end
    def answeringRule(id = nil)
      AnsweringRule.new(@rc, self, id)
    end
    def authzProfile()
      AuthzProfile.new(@rc, self)
    end
    def blockedNumber(id = nil)
      BlockedNumber.new(@rc, self, id)
    end
    def businessHours()
      BusinessHours.new(@rc, self)
    end
    def callLog(id = nil)
      CallLog.new(@rc, self, id)
    end
    def callLogSync()
      CallLogSync.new(@rc, self)
    end
    def companyPager()
      CompanyPager.new(@rc, self)
    end
    def conferencing()
      Conferencing.new(@rc, self)
    end
    def device(id = nil)
      Device.new(@rc, self, id)
    end
    def fax()
      Fax.new(@rc, self)
    end
    def forwardingNumber()
      ForwardingNumber.new(@rc, self)
    end
    def grant()
      Grant.new(@rc, self)
    end
    def greeting(id = nil)
      Greeting.new(@rc, self, id)
    end
    def meeting(id = nil)
      Meeting.new(@rc, self, id)
    end
    def meetingServiceInfo()
      MeetingServiceInfo.new(@rc, self)
    end
    def messageStore(id = nil)
      MessageStore.new(@rc, self, id)
    end
    def messageSync()
      MessageSync.new(@rc, self)
    end
    def phoneNumber(id = nil)
      PhoneNumber.new(@rc, self, id)
    end
    def presence()
      Presence.new(@rc, self)
    end
    def profileImage(id = nil)
      ProfileImage.new(@rc, self, id)
    end
    def ringout(id = nil)
      Ringout.new(@rc, self, id)
    end
    def sms()
      Sms.new(@rc, self)
    end
  def list(params = nil)
    Hashie::Mash.new JSON.parse(getResponse(params))
  end

  def get(params = nil)
    Hashie::Mash.new JSON.parse(getResponse(params))
  end

  def put(payload, params = nil)
    Hashie::Mash.new JSON.parse(putResponse(payload, params))
  end

  end
  class AddressBookSync < PathSegment
    def segment
      'address-book-sync'
    end
  def list(params = nil)
    Hashie::Mash.new JSON.parse(getResponse(params))
  end

  end
  class AddressBook < PathSegment
    def segment
      'address-book'
    end
    def contact(id = nil)
      Contact.new(@rc, self, id)
    end
    def group()
      Group.new(@rc, self)
    end
  end
  class Contact < PathSegment
    def segment
      'contact'
    end
  def post(payload, params = nil)
    Hashie::Mash.new JSON.parse(postResponse(payload, params))
  end

  def list(params = nil)
    Hashie::Mash.new JSON.parse(getResponse(params))
  end

  def delete(params = nil)
    deleteResponse(params)
  end

  def get(params = nil)
    Hashie::Mash.new JSON.parse(getResponse(params))
  end

  def put(payload, params = nil)
    Hashie::Mash.new JSON.parse(putResponse(payload, params))
  end

  end
  class Group < PathSegment
    def segment
      'group'
    end
  def list(params = nil)
    Hashie::Mash.new JSON.parse(getResponse(params))
  end

  end
  class AnsweringRule < PathSegment
    def segment
      'answering-rule'
    end
  def post(payload, params = nil)
    Hashie::Mash.new JSON.parse(postResponse(payload, params))
  end

  def list(params = nil)
    Hashie::Mash.new JSON.parse(getResponse(params))
  end

  def delete(params = nil)
    deleteResponse(params)
  end

  def get(params = nil)
    Hashie::Mash.new JSON.parse(getResponse(params))
  end

  def put(payload, params = nil)
    Hashie::Mash.new JSON.parse(putResponse(payload, params))
  end

  end
  class AuthzProfile < PathSegment
    def segment
      'authz-profile'
    end
    def check()
      Check.new(@rc, self)
    end
  def get(params = nil)
    Hashie::Mash.new JSON.parse(getResponse(params))
  end

  end
  class Check < PathSegment
    def segment
      'check'
    end
  def get(params = nil)
    Hashie::Mash.new JSON.parse(getResponse(params))
  end

  end
  class BlockedNumber < PathSegment
    def segment
      'blocked-number'
    end
  def post(payload, params = nil)
    Hashie::Mash.new JSON.parse(postResponse(payload, params))
  end

  def list(params = nil)
    Hashie::Mash.new JSON.parse(getResponse(params))
  end

  def delete(params = nil)
    deleteResponse(params)
  end

  def get(params = nil)
    Hashie::Mash.new JSON.parse(getResponse(params))
  end

  def put(payload, params = nil)
    Hashie::Mash.new JSON.parse(putResponse(payload, params))
  end

  end
  class BusinessHours < PathSegment
    def segment
      'business-hours'
    end
  def get(params = nil)
    Hashie::Mash.new JSON.parse(getResponse(params))
  end

  end
  class CallLogSync < PathSegment
    def segment
      'call-log-sync'
    end
  def list(params = nil)
    Hashie::Mash.new JSON.parse(getResponse(params))
  end

  end
  class CompanyPager < PathSegment
    def segment
      'company-pager'
    end
  def post(payload, params = nil)
    Hashie::Mash.new JSON.parse(postResponse(payload, params))
  end

  end
  class Conferencing < PathSegment
    def segment
      'conferencing'
    end
  def get(params = nil)
    Hashie::Mash.new JSON.parse(getResponse(params))
  end

  def put(payload, params = nil)
    Hashie::Mash.new JSON.parse(putResponse(payload, params))
  end

  end
  class Fax < PathSegment
    def segment
      'fax'
    end
  def post(payload, params = nil)
    Hashie::Mash.new JSON.parse(postResponse(payload, params))
  end

  end
  class ForwardingNumber < PathSegment
    def segment
      'forwarding-number'
    end
  def post(payload, params = nil)
    Hashie::Mash.new JSON.parse(postResponse(payload, params))
  end

  def list(params = nil)
    Hashie::Mash.new JSON.parse(getResponse(params))
  end

  end
  class Grant < PathSegment
    def segment
      'grant'
    end
  def list(params = nil)
    Hashie::Mash.new JSON.parse(getResponse(params))
  end

  end
  class Greeting < PathSegment
    def segment
      'greeting'
    end
  def post(payload, params = nil)
    Hashie::Mash.new JSON.parse(postResponse(payload, params))
  end

  def get(params = nil)
    Hashie::Mash.new JSON.parse(getResponse(params))
  end

  end
  class Meeting < PathSegment
    def segment
      'meeting'
    end
    def end()
      End.new(@rc, self)
    end
  def post(payload, params = nil)
    Hashie::Mash.new JSON.parse(postResponse(payload, params))
  end

  def list(params = nil)
    Hashie::Mash.new JSON.parse(getResponse(params))
  end

  def delete(params = nil)
    deleteResponse(params)
  end

  def get(params = nil)
    Hashie::Mash.new JSON.parse(getResponse(params))
  end

  def put(payload, params = nil)
    Hashie::Mash.new JSON.parse(putResponse(payload, params))
  end

  end
  class MeetingServiceInfo < PathSegment
    def segment
      'meeting/service-info'
    end
  def get(params = nil)
    Hashie::Mash.new JSON.parse(getResponse(params))
  end

  end
  class End < PathSegment
    def segment
      'end'
    end
  def post(payload, params = nil)
    Hashie::Mash.new JSON.parse(postResponse(payload, params))
  end

  end
  class MessageStore < PathSegment
    def segment
      'message-store'
    end
    def content(id = nil)
      Content.new(@rc, self, id)
    end
  def list(params = nil)
    Hashie::Mash.new JSON.parse(getResponse(params))
  end

  def delete(params = nil)
    deleteResponse(params)
  end

  def get(params = nil)
    Hashie::Mash.new JSON.parse(getResponse(params))
  end

  def put(payload, params = nil)
    Hashie::Mash.new JSON.parse(putResponse(payload, params))
  end

  end
  class Content < PathSegment
    def segment
      'content'
    end
  def get(params = nil)
    Hashie::Mash.new JSON.parse(getResponse(params))
  end

  end
  class MessageSync < PathSegment
    def segment
      'message-sync'
    end
  def list(params = nil)
    Hashie::Mash.new JSON.parse(getResponse(params))
  end

  end
  class PhoneNumber < PathSegment
    def segment
      'phone-number'
    end
  def list(params = nil)
    Hashie::Mash.new JSON.parse(getResponse(params))
  end

  def get(params = nil)
    Hashie::Mash.new JSON.parse(getResponse(params))
  end

  end
  class Presence < PathSegment
    def segment
      'presence'
    end
  def get(params = nil)
    Hashie::Mash.new JSON.parse(getResponse(params))
  end

  end
  class ProfileImage < PathSegment
    def segment
      'profile-image'
    end
  def get(params = nil)
    Hashie::Mash.new JSON.parse(getResponse(params))
  end

  def put(payload, params = nil)
    Hashie::Mash.new JSON.parse(putResponse(payload, params))
  end

  def post(payload, params = nil)
    Hashie::Mash.new JSON.parse(postResponse(payload, params))
  end

  end
  class Ringout < PathSegment
    def segment
      'ringout'
    end
  def post(payload, params = nil)
    Hashie::Mash.new JSON.parse(postResponse(payload, params))
  end

  def delete(params = nil)
    deleteResponse(params)
  end

  def get(params = nil)
    Hashie::Mash.new JSON.parse(getResponse(params))
  end

  end
  class Sms < PathSegment
    def segment
      'sms'
    end
  def post(payload, params = nil)
    Hashie::Mash.new JSON.parse(postResponse(payload, params))
  end

  end
  class Order < PathSegment
    def segment
      'order'
    end
  def post(payload, params = nil)
    Hashie::Mash.new JSON.parse(postResponse(payload, params))
  end

  def get(params = nil)
    Hashie::Mash.new JSON.parse(getResponse(params))
  end

  end
  class Recording < PathSegment
    def segment
      'recording'
    end
    def content(id = nil)
      Content.new(@rc, self, id)
    end
  def get(params = nil)
    Hashie::Mash.new JSON.parse(getResponse(params))
  end

  end
  class ServiceInfo < PathSegment
    def segment
      'service-info'
    end
  def get(params = nil)
    Hashie::Mash.new JSON.parse(getResponse(params))
  end

  end
  class ClientInfo < PathSegment
    def segment
      'client-info'
    end
    def customData(id)
      CustomData.new(@rc, self, id)
    end
  end
  class CustomData < PathSegment
    def segment
      'custom-data'
    end
  def put(payload, params = nil)
    Hashie::Mash.new JSON.parse(putResponse(payload, params))
  end

  end
  class Dictionary < PathSegment
    def segment
      'dictionary'
    end
    def country(id = nil)
      Country.new(@rc, self, id)
    end
    def language(id = nil)
      Language.new(@rc, self, id)
    end
    def location()
      Location.new(@rc, self)
    end
    def state(id = nil)
      State.new(@rc, self, id)
    end
    def timezone(id = nil)
      Timezone.new(@rc, self, id)
    end
  end
  class Country < PathSegment
    def segment
      'country'
    end
  def list(params = nil)
    Hashie::Mash.new JSON.parse(getResponse(params))
  end

  def get(params = nil)
    Hashie::Mash.new JSON.parse(getResponse(params))
  end

  end
  class Language < PathSegment
    def segment
      'language'
    end
  def list(params = nil)
    Hashie::Mash.new JSON.parse(getResponse(params))
  end

  def get(params = nil)
    Hashie::Mash.new JSON.parse(getResponse(params))
  end

  end
  class Location < PathSegment
    def segment
      'location'
    end
  def list(params = nil)
    Hashie::Mash.new JSON.parse(getResponse(params))
  end

  end
  class State < PathSegment
    def segment
      'state'
    end
  def list(params = nil)
    Hashie::Mash.new JSON.parse(getResponse(params))
  end

  def get(params = nil)
    Hashie::Mash.new JSON.parse(getResponse(params))
  end

  end
  class Timezone < PathSegment
    def segment
      'timezone'
    end
  def list(params = nil)
    Hashie::Mash.new JSON.parse(getResponse(params))
  end

  def get(params = nil)
    Hashie::Mash.new JSON.parse(getResponse(params))
  end

  end
  class NumberParser < PathSegment
    def segment
      'number-parser'
    end
    def parse()
      Parse.new(@rc, self)
    end
  end
  class Parse < PathSegment
    def segment
      'parse'
    end
  def post(payload, params = nil)
    Hashie::Mash.new JSON.parse(postResponse(payload, params))
  end

  end
  class NumberPool < PathSegment
    def segment
      'number-pool'
    end
    def lookup()
      Lookup.new(@rc, self)
    end
    def reserve()
      Reserve.new(@rc, self)
    end
  end
  class Lookup < PathSegment
    def segment
      'lookup'
    end
  def post(payload, params = nil)
    Hashie::Mash.new JSON.parse(postResponse(payload, params))
  end

  end
  class Reserve < PathSegment
    def segment
      'reserve'
    end
  def post(payload, params = nil)
    Hashie::Mash.new JSON.parse(postResponse(payload, params))
  end

  end
  class Subscription < PathSegment
    def segment
      'subscription'
    end
  def post(payload, params = nil)
    Hashie::Mash.new JSON.parse(postResponse(payload, params))
  end

  def list(params = nil)
    Hashie::Mash.new JSON.parse(getResponse(params))
  end

  def delete(params = nil)
    deleteResponse(params)
  end

  def get(params = nil)
    Hashie::Mash.new JSON.parse(getResponse(params))
  end

  def put(payload, params = nil)
    Hashie::Mash.new JSON.parse(putResponse(payload, params))
  end

  end
