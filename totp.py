import pyotp

def Code_generator(key):
    code=pyotp.TOTP(key)
    return code.now()

