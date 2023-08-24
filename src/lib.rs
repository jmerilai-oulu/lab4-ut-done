pub fn atbash_encrypt(message: &str) -> String {
    let mut encrypted_message = String::new();

    for c in message.chars() {
        let encrypted_char = match c {
            'A'..='Z' => ('Z' as u8 - (c as u8 - 'A' as u8)) as char,
            'a'..='z' => ('z' as u8 - (c as u8 - 'a' as u8)) as char,
            _ => c,
        };

        encrypted_message.push(encrypted_char);
    }

    encrypted_message
}

pub fn atbash_decrypt(message: &str) -> String {
    atbash_encrypt(message)
}

pub fn caesar_encrypt(message: &str, shift: u8) -> String {
    let mut encrypted_message = String::new();

    for c in message.chars() {
        let encrypted_char = match c {
            'A'..='Z' => (((c as u8 - b'A') + shift) % 26 + b'A') as char,
            'a'..='z' => (((c as u8 - b'a') + shift) % 26 + b'a') as char,
            _ => c,
        };

        encrypted_message.push(encrypted_char);
    }

    encrypted_message
}

pub fn caesar_decrypt(message: &str, shift: u8) -> String {
    caesar_encrypt(message, 26 - (shift % 26))
}

pub fn rot13_encrypt(message: &str) -> String {
    let mut encrypted_message = String::new();

    for c in message.chars() {
        let encrypted_char = match c {
            'A'..='M' | 'a'..='m' => ((c as u8) + 13) as char,
            'N'..='Z' | 'n'..='z' => ((c as u8) - 13) as char,
            _ => c,
        };

        encrypted_message.push(encrypted_char);
    }

    encrypted_message
}

pub fn rot13_decrypt(message: &str) -> String {
    rot13_encrypt(message)
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_caesar_encrypt() {
        assert_eq!(caesar_encrypt("hello world", 3), "khoor zruog");
    }

    #[test]
    fn test_caesar_decrypt() {
        assert_eq!(caesar_decrypt("khoor zruog", 3), "hello world");
    }

    #[test]
    fn test_rot13_encrypt() {
        assert_eq!(rot13_encrypt("hello world"), "uryyb jbeyq");
    }


}
