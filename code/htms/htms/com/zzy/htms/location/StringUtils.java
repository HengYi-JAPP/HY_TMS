package com.zzy.htms.location;

import java.math.BigDecimal;
import java.math.BigInteger;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Locale;
import java.util.Properties;
import java.util.Set;
import java.util.StringTokenizer;
import java.util.TreeSet;
import java.util.regex.Matcher;
import java.util.regex.Pattern;



/**

 * 该程序是基于Spring2.0的工具类org.springframework.util.StringUtils的，大部分的功能都是
 * Spring中的实现。但是原来的方法中的替换(replace)，分割(split)等方法都是没有基于正则表达式，
 * 使得他的功能很弱。所以我对此类方法进行了增强，并且保留原来的方法，如果想使用增强的方法，一般的
 * 命名方式是在原用方法名后面加上ByPattern，例如replaceByPattern,splitByPattern。
 * 
 * <p>
 * 并且在该类中增加了更多的方法，其中有中文注释的方法则为Tom Koo添加。

 */
@SuppressWarnings("unchecked")
public class StringUtils {

	private static final String FOLDER_SEPARATOR = "/";

	private static final String WINDOWS_FOLDER_SEPARATOR = "\\";

	private static final String TOP_PATH = "..";

	private static final String CURRENT_PATH = ".";

	private static final char EXTENSION_SEPARATOR = '.';

	public static final String PASSWOARD = "[[a-z]|[A-Z]|[0-9]]*";

	public static final String USERNAME = "[[a-z]|[A-Z]|[0-9]]*";

	public static final String NUMBER = "[0-9]*";

	public static final String LETTER = "[[A-Z]|[a-z]]*";

	public static final String PHONE_NO = "0[0-9]{2,3}-[0-9]{7,8}";

	public static final String MOBILE_PHONE_NO = "13[0-9][0-9]{8}";

	
	  public static boolean isNull(Object obj)
	  {
	    if (obj == null) return true;
	    if ((obj instanceof Number)) return isNaN((Number)obj);

	    return ("".equals(obj)) || ("null".equals(obj)) || (obj == null);
	  }
	  
	  public static boolean isNaN(Number n)
	  {
	    if (n == null) return true;
	    Class type = n.getClass();
	    if ((Integer.class == type) || (Integer.TYPE == type)) return n.equals(Integer.valueOf(-2147483648));
	    if ((Long.class == type) || (Long.TYPE == type)) return n.equals(Long.valueOf(-9223372036854775808L));
	    if ((Float.class == type) || (Float.TYPE == type)) return n.equals(Float.valueOf(1.4E-45F));
	    if ((Short.class == type) || (Short.TYPE == type)) return n.equals(Short.valueOf((short)-32768));
	    if ((Byte.class == type) || (Byte.TYPE == type)) return n.equals(Byte.valueOf((byte)-128));
	    if (BigDecimal.class == type) return n.equals(BigDecimal.valueOf(4.9E-324D));
	    if (BigInteger.class == type) return n.equals(BigInteger.valueOf(-9223372036854775808L));
	    return Double.isNaN(n.doubleValue());
	  }
	
	// ---------------------------------------------------------------------
	// General convenience methods for working with Strings
	// ---------------------------------------------------------------------

	/**
	 * Check that the given String is neither <code>null</code> nor of length 0.
	 * Note: Will return <code>true</code> for a String that purely consists of
	 * whitespace.
	 * <p>
	 * 
	 * <pre>
	 *                                                                                                StringUtils.hasLength(null) = false
	 *                                                                                                StringUtils.hasLength(&quot;&quot;) = false
	 *                                                                                                StringUtils.hasLength(&quot; &quot;) = true
	 *                                                                                                StringUtils.hasLength(&quot;Hello&quot;) = true
	 * </pre>
	 * 
	 * @param str
	 *            the String to check (may be <code>null</code>)
	 * @return <code>true</code> if the String is not null and has length
	 * @see #hasText(String)
	 */
	public static boolean hasLength(String str) {
		return (str != null && str.length() > 0);
	}

	/**
	 * Check whether the given String has actual text. More specifically,
	 * returns <code>true</code> if the string not <code>null<code>,
	 * its length is greater than 0, and it contains at least one non-whitespace character.
	 * <p><pre>
	 *                                                                                                StringUtils.hasText(null) = false
	 *                                                                                                StringUtils.hasText(&quot;&quot;) = false
	 *                                                                                                StringUtils.hasText(&quot; &quot;) = false
	 *                                                                                                StringUtils.hasText(&quot;12345&quot;) = true
	 *                                                                                                StringUtils.hasText(&quot; 12345 &quot;) = true
	 * </pre>
	 * 
	 * @param str
	 *            the String to check (may be <code>null</code>)
	 * @return <code>true</code> if the String is not <code>null</code>, its
	 *         length is greater than 0, and is does not contain whitespace only
	 * @see java.lang.Character#isWhitespace
	 */
	public static boolean hasText(String str) {
		if (!hasLength(str)) {
			return false;
		}
		int strLen = str.length();
		for (int i = 0; i < strLen; i++) {
			if (!Character.isWhitespace(str.charAt(i))) {
				return true;
			}
		}
		return false;
	}

	/**
	 * Check whether the given String contains any whitespace characters.
	 * 
	 * @param str
	 *            the String to check (may be <code>null</code>)
	 * @return <code>true</code> if the String is not empty and contains at
	 *         least 1 whitespace character
	 * @see java.lang.Character#isWhitespace
	 */
	public static boolean containsWhitespace(String str) {
		if (!hasLength(str)) {
			return false;
		}
		int strLen = str.length();
		for (int i = 0; i < strLen; i++) {
			if (Character.isWhitespace(str.charAt(i))) {
				return true;
			}
		}
		return false;
	}

	/**
	 * Trim leading and trailing whitespace from the given String.
	 * 
	 * @param str
	 *            the String to check
	 * @return the trimmed String
	 * @see java.lang.Character#isWhitespace
	 */
	public static String trimWhitespace(String str) {
		if (!hasLength(str)) {
			return str;
		}
		StringBuffer buf = new StringBuffer(str);
		while (buf.length() > 0 && Character.isWhitespace(buf.charAt(0))) {
			buf.deleteCharAt(0);
		}
		while (buf.length() > 0
				&& Character.isWhitespace(buf.charAt(buf.length() - 1))) {
			buf.deleteCharAt(buf.length() - 1);
		}
		return buf.toString();
	}

	/**
	 * Trim leading whitespace from the given String.
	 * 
	 * @param str
	 *            the String to check
	 * @return the trimmed String
	 * @see java.lang.Character#isWhitespace
	 */
	public static String trimLeadingWhitespace(String str) {
		if (!hasLength(str)) {
			return str;
		}
		StringBuffer buf = new StringBuffer(str);
		while (buf.length() > 0 && Character.isWhitespace(buf.charAt(0))) {
			buf.deleteCharAt(0);
		}
		return buf.toString();
	}

	/**
	 * Trim trailing whitespace from the given String.
	 * 
	 * @param str
	 *            the String to check
	 * @return the trimmed String
	 * @see java.lang.Character#isWhitespace
	 */
	public static String trimTrailingWhitespace(String str) {
		if (!hasLength(str)) {
			return str;
		}
		StringBuffer buf = new StringBuffer(str);
		while (buf.length() > 0
				&& Character.isWhitespace(buf.charAt(buf.length() - 1))) {
			buf.deleteCharAt(buf.length() - 1);
		}
		return buf.toString();
	}

	/**
	 * Trim <i>all</i> whitespace from the given String: leading, trailing, and
	 * inbetween characters.
	 * 
	 * @param str
	 *            the String to check
	 * @return the trimmed String
	 * @see java.lang.Character#isWhitespace
	 */
	public static String trimAllWhitespace(String str) {
		if (!hasLength(str)) {
			return str;
		}
		StringBuffer buf = new StringBuffer(str);
		int index = 0;
		while (buf.length() > index) {
			if (Character.isWhitespace(buf.charAt(index))) {
				buf.deleteCharAt(index);
			} else {
				index++;
			}
		}
		return buf.toString();
	}

	/**
	 * Test if the given String starts with the specified prefix, ignoring
	 * upper/lower case.
	 * 
	 * @param str
	 *            the String to check
	 * @param prefix
	 *            the prefix to look for
	 * @see java.lang.String#startsWith
	 */
	public static boolean startsWithIgnoreCase(String str, String prefix) {
		if (str == null || prefix == null) {
			return false;
		}
		if (str.startsWith(prefix)) {
			return true;
		}
		if (str.length() < prefix.length()) {
			return false;
		}
		String lcStr = str.substring(0, prefix.length()).toLowerCase();
		String lcPrefix = prefix.toLowerCase();
		return lcStr.equals(lcPrefix);
	}

	/**
	 * Test if the given String ends with the specified suffix, ignoring
	 * upper/lower case.
	 * 
	 * @param str
	 *            the String to check
	 * @param suffix
	 *            the suffix to look for
	 * @see java.lang.String#endsWith
	 */
	public static boolean endsWithIgnoreCase(String str, String suffix) {
		if (str == null || suffix == null) {
			return false;
		}
		if (str.endsWith(suffix)) {
			return true;
		}
		if (str.length() < suffix.length()) {
			return false;
		}

		String lcStr = str.substring(str.length() - suffix.length())
				.toLowerCase();
		String lcSuffix = suffix.toLowerCase();
		return lcStr.equals(lcSuffix);
	}

	/**
	 * Count the occurrences of the substring in string s.
	 * 
	 * @param str
	 *            string to search in. Return 0 if this is null.
	 * @param sub
	 *            string to search for. Return 0 if this is null.
	 */
	public static int countOccurrencesOf(String str, String sub) {
		if (str == null || sub == null || str.length() == 0
				|| sub.length() == 0) {
			return 0;
		}
		int count = 0, pos = 0, idx = 0;
		while ((idx = str.indexOf(sub, pos)) != -1) {
			++count;
			pos = idx + sub.length();
		}
		return count;
	}

	/**
	 * Replace all occurences of a substring within a string with another
	 * string.
	 * 
	 * @param inString
	 *            String to examine
	 * @param oldPattern
	 *            String to replace
	 * @param newPattern
	 *            String to insert
	 * @return a String with the replacements
	 */
	public static String replace(String inString, String oldPattern,
			String newPattern) {
		if (inString == null) {
			return null;
		}
		if (oldPattern == null || newPattern == null) {
			return inString;
		}

		StringBuffer sbuf = new StringBuffer();
		// output StringBuffer we'll build up
		int pos = 0; // our position in the old string
		int index = inString.indexOf(oldPattern);
		// the index of an occurrence we've found, or -1
		int patLen = oldPattern.length();
		while (index >= 0) {
			sbuf.append(inString.substring(pos, index));
			sbuf.append(newPattern);
			pos = index + patLen;
			index = inString.indexOf(oldPattern, pos);
		}
		sbuf.append(inString.substring(pos));

		// remember to append any characters to the right of a match
		return sbuf.toString();
	}

	/**
	 * Delete all occurrences of the given substring.
	 * 
	 * @param pattern
	 *            the pattern to delete all occurrences of
	 */
	public static String delete(String inString, String pattern) {
		return replace(inString, pattern, "");
	}

	/**
	 * Delete any character in a given string.
	 * 
	 * @param charsToDelete
	 *            a set of characters to delete. E.g. "az\n" will delete 'a's,
	 *            'z's and new lines.
	 */
	public static String deleteAny(String inString, String charsToDelete) {
		if (inString == null || charsToDelete == null) {
			return inString;
		}
		StringBuffer out = new StringBuffer();
		for (int i = 0; i < inString.length(); i++) {
			char c = inString.charAt(i);
			if (charsToDelete.indexOf(c) == -1) {
				out.append(c);
			}
		}
		return out.toString();
	}

	// ---------------------------------------------------------------------
	// Convenience methods for working with formatted Strings
	// ---------------------------------------------------------------------

	/**
	 * Quote the given String with single quotes.
	 * 
	 * @param str
	 *            the input String (e.g. "myString")
	 * @return the quoted String (e.g. "'myString'"), or
	 *         <code>null<code> if the input was <code>null</code>
	 */
	public static String quote(String str) {
		return (str != null ? "'" + str + "'" : null);
	}

	/**
	 * Turn the given Object into a String with single quotes if it is a String;
	 * keeping the Object as-is else.
	 * 
	 * @param obj
	 *            the input Object (e.g. "myString")
	 * @return the quoted String (e.g. "'myString'"), or the input object as-is
	 *         if not a String
	 */
	public static Object quoteIfString(Object obj) {
		return (obj instanceof String ? quote((String) obj) : obj);
	}

	/**
	 * Unqualify a string qualified by a '.' dot character. For example,
	 * "this.name.is.qualified", returns "qualified".
	 * 
	 * @param qualifiedName
	 *            the qualified name
	 */
	public static String unqualify(String qualifiedName) {
		return unqualify(qualifiedName, '.');
	}

	/**
	 * Unqualify a string qualified by a separator character. For example,
	 * "this:name:is:qualified" returns "qualified" if using a ':' separator.
	 * 
	 * @param qualifiedName
	 *            the qualified name
	 * @param separator
	 *            the separator
	 */
	public static String unqualify(String qualifiedName, char separator) {
		return qualifiedName
				.substring(qualifiedName.lastIndexOf(separator) + 1);
	}

	/**
	 * Capitalize a <code>String</code>, changing the first letter to upper case
	 * as per {@link Character#toUpperCase(char)}. No other letters are changed.
	 * 
	 * @param str
	 *            the String to capitalize, may be <code>null</code>
	 * @return the capitalized String, <code>null</code> if null
	 */
	public static String capitalize(String str) {
		return changeFirstCharacterCase(str, true);
	}

	/**
	 * Uncapitalize a <code>String</code>, changing the first letter to lower
	 * case as per {@link Character#toLowerCase(char)}. No other letters are
	 * changed.
	 * 
	 * @param str
	 *            the String to uncapitalize, may be <code>null</code>
	 * @return the uncapitalized String, <code>null</code> if null
	 */
	public static String uncapitalize(String str) {
		return changeFirstCharacterCase(str, false);
	}

	private static String changeFirstCharacterCase(String str,
			boolean capitalize) {
		if (str == null || str.length() == 0) {
			return str;
		}
		StringBuffer buf = new StringBuffer(str.length());
		if (capitalize) {
			buf.append(Character.toUpperCase(str.charAt(0)));
		} else {
			buf.append(Character.toLowerCase(str.charAt(0)));
		}
		buf.append(str.substring(1));
		return buf.toString();
	}

	/**
	 * Extract the filename from the given path, e.g. "mypath/myfile.txt" ->
	 * "myfile.txt".
	 * 
	 * @param path
	 *            the file path (may be <code>null</code>)
	 * @return the extracted filename, or <code>null</code> if none
	 */
	public static String getFilename(String path) {
		if (path == null) {
			return null;
		}
		int separatorIndex = path.lastIndexOf(FOLDER_SEPARATOR);
		return (separatorIndex != -1 ? path.substring(separatorIndex + 1)
				: path);
	}

	/**
	 * Extract the filename extension from the given path, e.g.
	 * "mypath/myfile.txt" -> "txt".
	 * 
	 * @param path
	 *            the file path (may be <code>null</code>)
	 * @return the extracted filename extension, or <code>null</code> if none
	 */
	public static String getFilenameExtension(String path) {
		if (path == null) {
			return null;
		}
		int sepIndex = path.lastIndexOf(EXTENSION_SEPARATOR);
		return (sepIndex != -1 ? path.substring(sepIndex + 1) : null);
	}

	/**
	 * Strip the filename extension from the given path, e.g.
	 * "mypath/myfile.txt" -> "mypath/myfile".
	 * 
	 * @param path
	 *            the file path (may be <code>null</code>)
	 * @return the path with stripped filename extension, or <code>null</code>
	 *         if none
	 */
	public static String stripFilenameExtension(String path) {
		if (path == null) {
			return null;
		}
		int sepIndex = path.lastIndexOf(EXTENSION_SEPARATOR);
		return (sepIndex != -1 ? path.substring(0, sepIndex) : path);
	}

	/**
	 * Apply the given relative path to the given path, assuming standard Java
	 * folder separation (i.e. "/" separators);
	 * 
	 * @param path
	 *            the path to start from (usually a full file path)
	 * @param relativePath
	 *            the relative path to apply (relative to the full file path
	 *            above)
	 * @return the full file path that results from applying the relative path
	 */
	public static String applyRelativePath(String path, String relativePath) {
		int separatorIndex = path.lastIndexOf(FOLDER_SEPARATOR);
		if (separatorIndex != -1) {
			String newPath = path.substring(0, separatorIndex);
			if (!relativePath.startsWith(FOLDER_SEPARATOR)) {
				newPath += FOLDER_SEPARATOR;
			}
			return newPath + relativePath;
		} else {
			return relativePath;
		}
	}


	/**
	 * Parse the given locale string into a <code>java.util.Locale</code>. This
	 * is the inverse operation of Locale's <code>toString</code>.
	 * 
	 * @param localeString
	 *            the locale string, following <code>java.util.Locale</code>'s
	 *            toString format ("en", "en_UK", etc). Also accepts spaces as
	 *            separators, as alternative to underscores.
	 * @return a corresponding Locale instance
	 */
	public static Locale parseLocaleString(String localeString) {
		String[] parts = tokenizeToStringArray(localeString, "_ ", false, false);
		String language = (parts.length > 0 ? parts[0] : "");
		String country = (parts.length > 1 ? parts[1] : "");
		String variant = (parts.length > 2 ? parts[2] : "");
		return (language.length() > 0 ? new Locale(language, country, variant)
				: null);
	}

	

	/**
	 * Copy the given Collection into a String array. The Collection must
	 * contain String elements only.
	 * 
	 * @param collection
	 *            the Collection to copy
	 * @return the String array (<code>null</code> if the Collection was
	 *         <code>null</code> as well)
	 */
	public static String[] toStringArray(Collection collection) {
		if (collection == null) {
			return null;
		}
		return (String[]) collection.toArray(new String[collection.size()]);
	}



	/**
	 * Split a String at the first occurrence of the delimiter. Does not include
	 * the delimiter in the result.
	 * 
	 * @param toSplit
	 *            the string to split
	 * @param delimiter
	 *            to split the string up with
	 * @return a two element array with index 0 being before the delimiter, and
	 *         index 1 being after the delimiter (neither element includes the
	 *         delimiter); or <code>null</code> if the delimiter wasn't found in
	 *         the given input String
	 */
	public static String[] splitFirst(String toSplit, String delimiter) {
		if (!hasLength(toSplit) || !hasLength(delimiter)) {
			return null;
		}
		int offset = toSplit.indexOf(delimiter);
		if (offset < 0) {
			return null;
		}
		String beforeDelimiter = toSplit.substring(0, offset);
		String afterDelimiter = toSplit.substring(offset + delimiter.length());
		return new String[] { beforeDelimiter, afterDelimiter };
	}

	/**
	 * Tokenize the given String into a String array via a StringTokenizer.
	 * Trims tokens and omits empty tokens.
	 * <p>
	 * The given delimiters string is supposed to consist of any number of
	 * delimiter characters. Each of those characters can be used to separate
	 * tokens. A delimiter is always a single character; for multi-character
	 * delimiters, consider using <code>delimitedListToStringArray</code>
	 * 
	 * @param str
	 *            the String to tokenize
	 * @param delimiters
	 *            the delimiter characters, assembled as String (each of those
	 *            characters is individually considered as delimiter).
	 * @return an array of the tokens
	 * @see java.util.StringTokenizer
	 * @see java.lang.String#trim
	 * @see #delimitedListToStringArray
	 */
	public static String[] tokenizeToStringArray(String str, String delimiters) {
		return tokenizeToStringArray(str, delimiters, true, true);
	}

	/**
	 * Tokenize the given String into a String array via a StringTokenizer.
	 * <p>
	 * The given delimiters string is supposed to consist of any number of
	 * delimiter characters. Each of those characters can be used to separate
	 * tokens. A delimiter is always a single character; for multi-character
	 * delimiters, consider using <code>delimitedListToStringArray</code>
	 * 
	 * @param str
	 *            the String to tokenize
	 * @param delimiters
	 *            the delimiter characters, assembled as String (each of those
	 *            characters is individually considered as delimiter)
	 * @param trimTokens
	 *            trim the tokens via String's <code>trim</code>
	 * @param ignoreEmptyTokens
	 *            omit empty tokens from the result array (only applies to
	 *            tokens that are empty after trimming; StringTokenizer will not
	 *            consider subsequent delimiters as token in the first place).
	 * @return an array of the tokens
	 * @see java.util.StringTokenizer
	 * @see java.lang.String#trim
	 * @see #delimitedListToStringArray
	 */
	public static String[] tokenizeToStringArray(String str, String delimiters,
			boolean trimTokens, boolean ignoreEmptyTokens) {

		StringTokenizer st = new StringTokenizer(str, delimiters);
		List tokens = new ArrayList();
		while (st.hasMoreTokens()) {
			String token = st.nextToken();
			if (trimTokens) {
				token = token.trim();
			}
			if (!ignoreEmptyTokens || token.length() > 0) {
				tokens.add(token);
			}
		}
		return toStringArray(tokens);
	}

	/**
	 * Take a String which is a delimited list and convert it to a String array.
	 * <p>
	 * A single delimiter can consists of more than one character: It will still
	 * be considered as single delimiter string, rather than as bunch of
	 * potential delimiter characters - in contrast to
	 * <code>tokenizeToStringArray</code>.
	 * 
	 * @param str
	 *            the input String
	 * @param delimiter
	 *            the delimiter between elements (this is a single delimiter,
	 *            rather than a bunch individual delimiter characters)
	 * @return an array of the tokens in the list
	 * @see #tokenizeToStringArray
	 */
	public static String[] delimitedListToStringArray(String str,
			String delimiter) {
		if (str == null) {
			return new String[0];
		}
		if (delimiter == null) {
			return new String[] { str };
		}
		List result = new ArrayList();
		if ("".equals(delimiter)) {
			for (int i = 0; i < str.length(); i++) {
				result.add(str.substring(i, i + 1));
			}
		} else {
			int pos = 0;
			int delPos = 0;
			while ((delPos = str.indexOf(delimiter, pos)) != -1) {
				result.add(str.substring(pos, delPos));
				pos = delPos + delimiter.length();
			}
			if (str.length() > 0 && pos <= str.length()) {
				// Add rest of String, but not in case of empty input.
				result.add(str.substring(pos));
			}
		}
		return toStringArray(result);
	}

	/**
	 * Convert a CSV list into an array of Strings.
	 * 
	 * @param str
	 *            CSV list
	 * @return an array of Strings, or the empty array if s is null
	 */
	public static String[] commaDelimitedListToStringArray(String str) {
		return delimitedListToStringArray(str, ",");
	}

	/**
	 * Convenience method to convert a CSV string list to a set. Note that this
	 * will suppress duplicates.
	 * 
	 * @param str
	 *            CSV String
	 * @return a Set of String entries in the list
	 */
	public static Set commaDelimitedListToSet(String str) {
		Set set = new TreeSet();
		String[] tokens = commaDelimitedListToStringArray(str);
		for (int i = 0; i < tokens.length; i++) {
			set.add(tokens[i]);
		}
		return set;
	}

	


	public static String arrayToDelimitedString(String[] arr, String delim) {
		if (arr == null || arr.length == 0) {
			return "";
		}
		StringBuffer sb = new StringBuffer();
		for (int i = 0; i < arr.length; i++) {
			if (i > 0) {
				sb.append(delim);
			}
			if (arr[i] == null) {
				sb.append("");
			} else {
				sb.append(arr[i]);
			}
		}
		return sb.toString();
	}


	// -------------------------------------------------------------------------------------------


	/**
	 * 
	 * @param str
	 * @return
	 */
	public static boolean isNullOrBlank(String str) {
		if (str == null) {
			return true;
		} else if (str.equals("")) {
			return true;
		} else {
			return false;
		}
	}



	/**
	 * 去掉字符串中 回车符 换行符 制表符
	 * 
	 * @param str
	 * @return
	 */
	public static String parseToString(String str) {
		if (str == null) {
			return null;
		}
		return str.replaceAll("\r|\n|\t", " ");
	}

	public static String getText(String info, Object... arg) {

		if (arg != null && arg.length > 0) {
			for (int i = 0; i < arg.length; i++) {
				String val = arg[i] == null ? "" : arg[i].toString();
				// String replaceAll(regex, replacement)函数 ,
				// 由于第一个参数支持正则表达式，replacement中出现"$",会按照$1$2的分组
				// 模式进行匹配，当编译器发现"$"后跟的不是整数的时候，就会抛出"非法的组引用"的异常。
				// 所以我们在使用replaceAll(regex,replacement)函数的时候,
				// 要把String中的字符替换成"$AAA"的话，可以对replacement进行"$"的转义处理,filterDollarStr就是用来做转义处理的函数
				info = info.replaceAll("(\\{" + i + "\\})",
						filterDollarStr(val));
			}
		}
		return info;
	}

	/**
	 * String replaceAll(regex, replacement)函数 ,
	 * 由于第一个参数支持正则表达式，replacement中出现"$",会按照$1$2的分组
	 * 模式进行匹配，当编译器发现"$"后跟的不是整数的时候，就会抛出"非法的组引用"的异常。
	 * 所以我们在使用replaceAll(regex,replacement)函数的时候,
	 * 要把String中的字符替换成"$AAA"的话，可以对replacement进行
	 * "$"的转义处理,filterDollarStr就是用来做转义处理的函数
	 * 
	 * @param str
	 * @return
	 */
	public static String filterDollarStr(String str) {
		StringBuffer sReturn = new StringBuffer("");
		if (str.indexOf('$', 0) > -1) {
			while (str.length() > 0) {
				if (str.indexOf('$', 0) > -1) {
					sReturn.append(str.subSequence(0, str.indexOf('$', 0)));
					sReturn.append("\\$");
					str = str.substring(str.indexOf('$', 0) + 1, str.length());
				} else {
					sReturn.append(str);
					str = "";
				}
			}
		} else {
			sReturn = new StringBuffer(str);
		}
		return sReturn.toString();
	}

	/**
	 * 分割字符串,查询的时候用ID的时候超过1000个会出问题的解决方法
	 * 
	 * @param strs
	 * @return
	 */
	public static List<String> getSplitStr(String strs) {
		List<String> list = new ArrayList<String>();
		StringBuffer strTemp = new StringBuffer();
		if (strs == null) {
			return list;
		}
		String[] strGroup = strs.split(",");
		for (int i = 0; i < strGroup.length; i++) {
			if (i != 0 && i % 1000 == 0) {
				list.add(strTemp.toString().substring(0,
						strTemp.toString().length() - 1));
				strTemp = new StringBuffer();
				strTemp.append(strGroup[i]).append(",");
			} else {
				strTemp.append(strGroup[i]).append(",");
			}
		}
		list.add(strTemp.toString().substring(0,
				strTemp.toString().length() - 1));
		return list;
	}

	/**
	 * 用户String提供的split方法会过滤掉后面的空字符串，所以提供本方法，严格按照分隔符个数形成数组
	 * 
	 * 例如有一个字符串"1,2,3,4,,,"，使用原生string的split形成的字符串数组为{"1","2","3","4"}，
	 * 而用本函数则返回数组{"1","2","3","4","",""}
	 * 
	 * @param input
	 *            本分割的字符串或者StringBuffer对象
	 * @param delimiterPattern
	 *            分割字符
	 * @param limit
	 *            参数控制模式应用的次数，因此影响结果数组的长度。如果该限制 n 大于 0，则模式将被最多应用 n - 1
	 *            次，数组的长度将不会大于 n，而且数组的最后项将包含超出最后匹配的定界符的所有输入。如果 n
	 *            为非正，则模式将被应用尽可能多的次数，而且数组可以是任意长度。如果 n
	 *            为零，则模式将被应用尽可能多的次数，数组可有任何长度，并且结尾空字符串将被丢弃。
	 * @return
	 */
	public static String[] split(CharSequence input, String delimiterPattern,
			int limit) {
		if (input == null)
			return new String[] {};
		int index = 0;
		boolean matchLimited = limit > 0;
		ArrayList matchList = new ArrayList();
		Pattern p = Pattern.compile(delimiterPattern);
		Matcher m = p.matcher(input);

		// Add segments before each match found
		while (m.find()) {
			if (!matchLimited || matchList.size() < limit - 1) {
				String match = input.subSequence(index, m.start()).toString();
				matchList.add(match);
				index = m.end();
			} else if (matchList.size() == limit - 1) { // last one
				String match = input.subSequence(index, input.length())
						.toString();
				matchList.add(match);
				index = m.end();
			}
		}

		// If no match was found, return this
		if (index == 0)
			return new String[] { input.toString() };

		// Add remaining segment
		if (!matchLimited || matchList.size() < limit)
			matchList.add(input.subSequence(index, input.length()).toString());

		// Construct result
		int resultSize = matchList.size();
		// 去掉的代码是同jdk原生split方法的不同之处，例如有一个字符串"1,2,3,4,,,"，使用原生string的split形成的字符串数组为{"1","2","3","4"}，而用本函数则返回数组{"1","2","3","4","",""}
		// if (limit == 0)
		// while (resultSize > 0 && matchList.get(resultSize - 1).equals(""))
		// resultSize--;
		String[] result = new String[resultSize];
		return (String[]) matchList.subList(0, resultSize).toArray(result);
	}

	/**
	 * 判断一个字符串中是否包含一个子串,不区分大小写
	 * 
	 * @param str
	 *            String
	 * @param subString
	 *            String
	 * @return boolean
	 */
	public static boolean isIncludeSubString(String str, String subString) {
		boolean result = false;
		if (str == null || subString == null) {
			return false;
		}
		int strLength = str.length();
		int subStrLength = subString.length();
		String tmpStr = null;
		for (int i = 0; i < strLength; i++) {
			if (strLength - i < subStrLength) {
				return false;
			}
			tmpStr = str.substring(i, subStrLength + i);
			if (tmpStr.endsWith(subString)) {
				return true;
			}
		}
		return result;
	}

	/**
	 * /** 用户String提供的split方法会过滤掉后面的空字符串，所以提供本方法，严格按照分隔符个数形成数组
	 * 
	 * 例如有一个字符串"1,2,3,4,,,"，使用原生string的split形成的字符串数组为{"1","2","3","4"}，
	 * 而用本函数则返回数组{"1","2","3","4","",""}
	 * 
	 * @param input
	 *            本分割的字符串或者StringBuffer对象
	 * @param delimiterPattern
	 *            分割字符
	 * @return
	 */
	public static String[] split(CharSequence input, String delimiterPattern) {
		return split(input, delimiterPattern, 0);
	}

	/**
	 * 将字符串str 按照length长度为一个字符串平均分割。 如果length<=0，则返回null。 wuwm
	 * 
	 * @param str
	 * @param length
	 * @return String[]
	 */
	public static String[] splitSameLegthArray(String str, int length) {
		if (length <= 0 || str == null) {
			return null;
		}
		String[] strArr = new String[str.length() / length + 1];

		char[] cStr = str.toCharArray();
		StringBuffer buf = new StringBuffer();
		int count = 0;
		int leg = 0;
		for (char s : cStr) {
			if (count != length) {
				buf.append(String.valueOf(s));
				count++;
			} else {
				strArr[leg++] = buf.toString();
				buf.delete(0, buf.length());
				buf.append(String.valueOf(s));
				count = 1;
			}
		}
		if (buf.length() != 0) {
			strArr[leg++] = buf.toString();
		}
		return strArr;
	}

	public static Properties toProperties(String str) {
		return toProperties(str, ",");
	}

	public static Properties toProperties(String str, String split) {
		Properties props = new Properties();
		if (!StringUtils.hasLength(str)) {
			return props;
		}
		String[] lines = str.split(split);
		for (String line : lines) {
			if (line == null) {
				return null;
			}
			line = StringUtils.trimLeadingWhitespace(line);
			if (line.length() > 0) {
				char firstChar = line.charAt(0);
				if (firstChar != '#' && firstChar != '!') {
					int separatorIndex = line.indexOf("=");
					if (separatorIndex == -1) {
						separatorIndex = line.indexOf(":");
					}
					String key = (separatorIndex != -1 ? line.substring(0,
							separatorIndex) : line);
					String value = (separatorIndex != -1) ? line
							.substring(separatorIndex + 1) : "";
					key = StringUtils.trimTrailingWhitespace(key);
					value = StringUtils.trimLeadingWhitespace(value);
					props.put(key, value);
				}
			}
		}
		return props;
	}
	
	public static String fillToFront(Object obj,int length,char fileStr) {
		
		StringBuffer buf = new StringBuffer(obj == null ? "" : obj.toString()) ;
		if(buf.length()>length){
			throw new RuntimeException(StringUtils.getText(
					"value length great maxLength:{0}",
					length));
		}
		for(int i = length-buf.length() ; i>0 ; i-- ){
			buf.insert(0, fileStr) ;
		}
		return buf.toString() ;
	}
	
	/**
	 * <p>将Blob对象转换成String对象</p>
	 * @param src
	 * @return
	 * @throws SQLException
	 *
	 * @author yangjianguo
	 * @since Oct 9, 2012
	 */
	public static String transBlob2String(Blob src) throws RuntimeException{
		if(src==null){
			return "";
		}
		try {
			byte[] temp = src.getBytes(1L, new Long(src.length()).intValue());
			return new String(temp,"UTF-8");
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}
	

	
   public static String toPattern(String src){
	   if(isNullOrBlank(src)){
		   return "*";
	   } 
	   return src;
   }
   
   
   
	
	
	public static String toString(Object obj) {
		return obj == null ? "" : obj.toString();
	}

	public static void main(String... args) {
		// Properties p =
		// toProperties("mail.smtp.auth=sdds,mail.smtp.auth0=fasle");
		// System.out.println(p.getProperty("mail.smtp.auth"));
		// System.out.println(p.getProperty("mail.smtp.auth0"));
	}

}
