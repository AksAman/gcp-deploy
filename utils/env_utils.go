package utils

import (
	"os"
	"strconv"
)

func GetEnv[T comparable](key string, defaultValue T) T {

	value, ok := os.LookupEnv(key)
	if !ok || value == "" {
		return defaultValue
	}

	switch any(defaultValue).(type) {
	case string:
		return any(value).(T)
	case int:
		if intValue, err := strconv.Atoi(value); err == nil {
			return any(intValue).(T)
		}
		return defaultValue
	case bool:
		if boolValue, err := strconv.ParseBool(value); err == nil {
			return any(boolValue).(T)
		}
		return defaultValue
	case float64:
		if floatValue, err := strconv.ParseFloat(value, 64); err == nil {
			return any(floatValue).(T)
		}
		return defaultValue
	default:
		return defaultValue
	}

}
