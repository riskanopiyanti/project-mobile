// LoginScreen.js
import React, { useState } from 'react';
import { View, Text, TextInput, TouchableOpacity, StyleSheet, Alert } from 'react-native';
import axios from 'axios';

const LoginScreen = ({ navigation }) => {
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');

  const handleLogin = async () => {
    try {
      const response = await axios.post('https://api.example.com/login', { email, password });
      if (response.data.success) {
        navigation.navigate('Dashboard');
      } else {
        Alert.alert('Login Gagal', response.data.message);
      }
    } catch (error) {
      Alert.alert('Error', 'Terjadi kesalahan saat login');
    }
  };

  return (
    <View style={styles.container}>
      <Text style={styles.logo}>VeggieHub</Text>
      <TextInput
        style={styles.input}
        placeholder="Email"
        value={email}
        onChangeText={setEmail}
      />
      <TextInput
        style={styles.input}
        placeholder="Kata Sandi"
        secureTextEntry
        value={password}
        onChangeText={setPassword}
      />
      <TouchableOpacity style={styles.loginButton} onPress={handleLogin}>
        <Text style={styles.loginButtonText}>Masuk</Text>
      </TouchableOpacity>
    </View>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    padding: 16,
    backgroundColor: '#E5F5E3',
  },
  logo: {
    fontSize: 32,
    textAlign: 'center',
    marginBottom: 24,
    color: '#4CAF50',
    fontWeight: 'bold',
  },
  input: {
    borderWidth: 1,
    borderColor: '#4CAF50',
    padding: 12,
    marginVertical: 10,
    borderRadius: 8,
    backgroundColor: '#fff',
  },
  loginButton: {
    backgroundColor: '#4CAF50',
    padding: 15,
    borderRadius: 8,
    alignItems: 'center',
    marginTop: 10,
  },
  loginButtonText: {
    color: '#fff',
    fontWeight: 'bold',
  },
});

export default LoginScreen;

